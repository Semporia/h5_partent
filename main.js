import Vue from 'vue'
import App from './App'

import footnav from "@/components/footnav"
import indexConfig from "config/index.config.js"
import constData from './config/constData.config.js'
import { http } from '@/utils/request';
Vue.prototype.http = http;

Vue.prototype.constData = constData;
// import 'lib-flexible'
Vue.config.productionTip = false
Vue.component('footnav', footnav);
App.mpType = 'app'

Vue.prototype.reLoadSize = function() {
	var html = document.getElementsByTagName("html")[0];
	var body = document.getElementsByTagName("body")[0];
	var width = document.body.offsetWidth; // 获取当前页面的宽度
	console.log(width);
	var nowFont = width / 375 * 37.5; // 通过标签名称来获取元素 
	html.style.fontSize = nowFont + "px";
	// console.log(html);
	body.style = "font-size: 12px; overflow: auto;";
	console.log("已设置");
}

Vue.prototype.getLocalUser = function() {
	var user = {};
	try {
		const value = uni.getStorageSync('user');
		if (value) {
			user = value;
		}
	} catch (e) {

	}
	return user;
}

// 通用网络上传
Vue.prototype.upload = function(opt) {
	uni.showLoading({
		title: ' 上传中,请稍后...'
	});
	opt = opt || {};
	opt.url = opt.url || '';
	opt.name = opt.name || 'file';
	opt.data = opt.data || {};
	opt.success = opt.success || function() {};
	opt.complete = opt.complete || function() {};
	opt.fail = opt.fail || function() {};
	try {
		opt.data['from_user_id'] = uni.getStorageSync('from_user_id');
	} catch (e) {
		opt.data['from_user_id'] = 0;
	}

	try {
		opt.data['token'] = uni.getStorageSync('token');
	} catch (e) {
		opt.data['token'] = "";
	}
	uni.uploadFile({
		url: indexConfig.baseUrl + opt.url,
		filePath: opt.filePath,
		name: opt.name,
		formData: opt.data,
		dataType: 'json',
		success: (uploadFileRes) => {
			opt.success(JSON.parse(uploadFileRes.data));
		},
		complete: () => {
			opt.complete();
			uni.hideLoading();
		},
		fail: () => {
			opt.fail();
		}
	});

}


Vue.prototype.syncUser = function() {
	var _this = this;
	_this.post({
		url: '/user/home',
		data: {},
		success: function(res) {
			_this.shop = res.data.data.shop;
			_this.partner_rule = res.data.data.partner_rule;
			if (res.data.err == 0) {
				_this.user = res.data.data.user;
				_this.extInfo = res.data.data.extInfo;
				_this.footPrintList = res.data.data.foot_print;
				_this.shop_customer = res.data.data.shop_customer;
				_this.coupons_num = res.data.data.coupons_num;
				uni.setStorageSync('common', res.data.data);
				uni.setStorageSync('user', res.data.data.user);
				_this.hasLogin = true;
			} else {
				uni.setStorageSync('user', {});
				uni.setStorageSync('common', {});
			}

		}
	});
}

// 通用网络提交
Vue.prototype.post = function(opt) {
	// uni.showLoading({
	//     title: '加载中,请稍后...'
	// });
	opt = opt || {};
	opt.url = opt.url || '';
	opt.data = opt.data || {};
	opt.method = opt.method || 'POST';
	// 'Access-Control-Request-Headers':'Presetproperties'
	// opt.header = opt.header || {"Content-Type": "application/json"};
	opt.success = opt.success || function() {};
	opt.complete = opt.complete || function() {};
	opt.fail = opt.fail || function() {};

	try {
		opt.data['from_user_id'] = uni.getStorageSync('from_user_id');
	} catch (e) {
		opt.data['from_user_id'] = 0;
	}
	opt.data['shop_id'] = 1;
	try {
		opt.data['token'] = uni.getStorageSync('token');
	} catch (e) {
		// opt.data['token'] = "ejOqPNAkwocHRJpp4hHwhRI12jagzRHIPk7D8ezrXxz5tMAxM2Iacll45LiVLuXZ";
	}
	// opt.data['token'] = "ejOqPNAkwocHRJpp4hHwhRI12jagzRHIPk7D8ezrXxz5tMAxM2Iacll45LiVLuXZ";
	// opt.data.remove('sign');
	uni.request({
		url: indexConfig.baseUrl + opt.url,
		data: opt.data,
		method: opt.method,
		header: opt.header,
		dataType: 'json',
		success: function(res) {
			opt.success(res);
		},
		fail: function() {
			uni.showToast({
				icon: 'loading',
				title: '网络故障,请稍后重试。'
			});
			opt.fail();
		},
		complete: function() {
			console.log('complete');
			// uni.hideLoading();
			opt.complete();
		}
	})

}

Vue.prototype.NavTo = function(path) {
	uni.navigateTo({
		url: path
	})
}
const app = new Vue({
	...App
})
app.$mount()
