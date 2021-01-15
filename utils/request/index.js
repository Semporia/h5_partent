/* eslint-disable */
import Request from './request';
import indexConfig from '@/config/index.config';
const http = new Request();

// request全局参数设置
http.setConfig(config => {
	/* 设置全局配置 */
	config.baseUrl = indexConfig.baseUrl; /* 根域名不同 */
	const systemInfo = uni.getSystemInfoSync();
	const systemInfoHeaders = {
		'device-name': systemInfo.brand, // 设备名称
		width: systemInfo.screenWidth, // 屏幕宽度
		height: systemInfo.screenHeight, // 屏幕高度
		os: systemInfo.platform, // 客户端平台
		'os-version': systemInfo.system // 操作系统版本
	};
	config.header = {
		...config.header,
		...systemInfoHeaders
	};
	return config;
});

let isRefreshing = false;
let requests = [];

http.interceptor.request(
	config => {
		/* 请求之前拦截器 */
		config.header['x-api-key'] = uni.getStorageSync('token');
		// 单商户
		// config.header['merchant-id'] = uni.getStorageSync('merchantId') || 1;
		return config;
	},
	error => {
		return Promise.reject(error);
	}
);



http.interceptor.response(
	async response => {
		/* 请求之后拦截器 */
		switch (response.data.err) {
			case 0:
				return response.data.data;
			case 1:
				uni.showToast({
					title: response.data.msg,
					duration: 200
				});
			case 400:
				uni.showToast({
					title: response.data.msg,
					duration: 2000
				});
				return Promise.reject(response.data.message);
				break;
		}
		// return response.data;
		console.log(response.data);
			
	},
	error => {
		return Promise.reject(error);
	}
);

export { http };
