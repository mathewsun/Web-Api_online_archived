﻿using Microsoft.AspNetCore.SignalR;
using Newtonsoft.Json;
using Quartz;
using System.Threading.Tasks;
using Web_Api.online.Data.Repositories;
using Web_Api.online.Models;

namespace Web_Api.online.Jobs
{
    [DisallowConcurrentExecution]
    public class BtcUsdtJob : Hub, IJob
    {
        private readonly TradeRepository _tradeRepository;
        public BtcUsdtJob(TradeRepository tradeRepository)
        {
            _tradeRepository = tradeRepository;
        }
        
        public async Task Execute(IJobExecutionContext context)
        {
            var openOrdersBuy = _tradeRepository.GetBuyOrderBookAsync("BTC_USDT").Result;
            var openOrdersSell = _tradeRepository.GetSellOrderBookAsync("BTC_USDT").Result;
            var marketTrades = _tradeRepository.GetClosedOrders_Top100("BTC_USDT").Result;

            var recieveResult = new RecieveMessageResultModel()
            {
                OrderBookBuy = openOrdersBuy,
                OrderBookSell = openOrdersSell,
                MarketTrades = marketTrades
            };

            this.Clients?.All.SendAsync($"ReceiveMessage", JsonConvert.SerializeObject(recieveResult)).Wait();
        }
    }
}
