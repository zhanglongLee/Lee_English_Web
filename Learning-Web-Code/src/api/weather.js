import weatherApi from '@/utils/weather'
// api控制台https://www.nowapi.com/api/weather.realtime
// 获取天气信息
// Path： http://api.k780.com
// Method： get
export const getWeather = cityIp => {
    return weatherApi({
        method: 'GET',
        params: {
            cityIp:cityIp,
            appkey: '10003',
            sign: 'b59bc3ef6191eb9f747dd4e83c99f2a4',
            format: 'json',
            app: 'weather.realtime',
            ag:'today,futureDay,lifeIndex,futureHour'
        }
    })
}
// http://api.k780.com/?app=weather.realtime&weaId=1&ag=today,futureDay,lifeIndex,futureHour&appkey=10003&sign=b59bc3ef6191eb9f747dd4e83c99f2a4&format=json