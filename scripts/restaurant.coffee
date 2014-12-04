# Description:
#   Google検索でグルメ関連のサイトに絞った検索URLを表示します。
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot レストラン 検索キーワード

client = require('cheerio-httpcli')
querystring = require('querystring')
util = require('util')
sites = [{name: '食べログ', url: 'http://tabelog.com'},
  {name: 'ぐるなび', url: 'http://r.gnavi.co.jp'},
  {name: 'Retty', url:  'http://retty.me'}]
GOOGLE_SEARCH_URL = 'http://www.google.com/search?q='

module.exports = (robot) ->
  robot.respond /レストラン\s(.*)/, (msg) ->
    for site in sites
      msg.send util.format('%sでレストランを探すぞ！！ キーワード[%s]', site.name, msg.match[1])
      url = GOOGLE_SEARCH_URL + querystring.escape(msg.match[1] + ' site:' + site.url)
      msg.send url
      
