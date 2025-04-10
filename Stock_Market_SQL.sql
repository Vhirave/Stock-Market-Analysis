Create Database Stock_Market;
USE Stock_Market;

select count(*) as Total_Row from stock_Market;

-- Average Daily Trading Volume -- 

select Ticker, round(avg(Volume),2) as Average_of_Volume from stock_market
group by Ticker
Order by Average_of_Volume;

-- Most Volatile Stocks --

select Ticker, round(avg(Beta), 6) as Average_Of_Beta from stock_market
group by Ticker
Order By Average_Of_Beta;

-- Stocks with Highest Dividend and Lowest Dividend --

select Ticker, sum(Dividend_Amount) as Dividend_Amount from stock_market
group by Ticker
order by Dividend_Amount desc;

-- Highest and Lowest P/E Ratios --

select Ticker, max(PE_Ratio) as Max_PE_Ratio, min(PE_Ratio) as Min_PE_Ratio from stock_market
Group by Ticker
Order by Max_PE_Ratio DESC;

-- Stocks with Highest Market Cap --

Select Ticker, sum(Market_Cap) as Market_Cap from stock_market
group by Ticker
Order by Market_Cap desc;
 
-- Stocks Near 52 Week High --

Select Ticker, round(sum(52_Week_High), 2) as 52_Week_High from stock_market
group by Ticker;

-- Stocks Near 52 Week Low --

Select Ticker, round(sum(52_Week_low), 2) as 52_Week_High from stock_market
group by Ticker;

-- Stocks with Strong Buy Signals and stocks with Strong Selling Signal --

#a.

select *,
case
when RSI<45 then "Potential Buying opportunity"
when RSI > 45 & RSI < 68 then "Neutral Zone"
when RSI > 69 then "Strong Buying"
end as RSI_Indicator
from stock_market; 

#b.

select *,
case 
when MACD > 0 then "Buying Signal"
When MACD < 0 then "Selling Signal"
end as MACD_Indicator
from stock_market;


