<template>
	<view>
		<view id="app">
			<view class="balaceWrap">
				<view class="formWrap">
					<view class="wrap">
						<view class="title">
							<view class="titleTop">累计收入</view>
							<view class="allMoney">￥{{un_pay+payed}}</view>
						</view>
					</view>
					<view class="wrap">
						<view class="title">
							<view>{{un_pay}}</view>
							<view>待提现金额</view>
						</view>
						<view class="title">
							<view>{{payed}}</view>
							<view>已提现金额</view>
						</view>
					</view><button class="submit van-button van-button--primary van-button--normal" @click="toWithdraw"><span class="van-button__text">申请提现</span></button>
					<view class="title1">收入记录</view>
					<view role="feed" class="listArr van-list">
						<view v-for="(item,index) in shop_accounts" :key="index" >
							<view>
								<view>佣金</view>
								<view>+{{item.partner_money}}</view>
							</view>
							<view>
								<view>{{item.created_at}}</view>
							</view>
						</view>
						
						<view class="van-list__placeholder"></view>
					</view>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				shop_accounts:[],
				un_pay:0,
				payed:0,
			}
		},
		onShow() {
			this.reLoadSize();
			this.loadData();
		},
		methods: {
			async loadData(){
				var _this = this;
				await this.http.post("/partner/getAccounts",{'shop_id':1}).then(
					async r => {
						_this.shop_accounts = r.shop_accounts;  
						_this.un_pay = r.un_pay;  
						_this.payed = r.payed;  
				    }
				)
			},
			async toWithdraw(){
				var _this = this;
				await this.http.post("/partner/toWithdraw",{'shop_id':1}).then(
					async r => {
						 
				    }
				)
			}
		}
	}
</script>

<style>

[class*=van-]:focus,button:focus{outline:0;}
.van-button{position:relative;display:-webkit-inline-box;display:-webkit-inline-flex;display:inline-flex;-webkit-box-align:center;-webkit-align-items:center;align-items:center;-webkit-box-pack:center;-webkit-justify-content:center;justify-content:center;box-sizing:border-box;height:1.17333rem;margin:0;padding:0;font-size:.42667rem;line-height:1.2;text-align:center;border-radius:.05333rem;cursor:pointer;-webkit-transition:opacity .2s;transition:opacity .2s;-webkit-appearance:none;}
.van-button:before{position:absolute;top:50%;left:50%;width:100%;height:100%;background-color:#000;border:inherit;border-color:#000;border-radius:inherit;-webkit-transform:translate(-50%,-50%);transform:translate(-50%,-50%);opacity:0;content:" ";}
.van-button:active:before{opacity:.1;}
.van-button--primary{color:#fff;background-color:#07c160;border:.02667rem solid #07c160;}
.van-button--normal{padding:0 .4rem;font-size:.37333rem;}
.van-list__placeholder{height:0;pointer-events:none;}
button{color:inherit;font:inherit;}
[class*=van-]:focus,button:focus{outline:none;}
*{margin:0;padding:0;}
* button{border:none;}
*{touch-action:pan-y;}
#app{width:100%;height:100%;}
.wrap{display:inline-block;}
.balaceWrap{height:100%;}
.balaceWrap .title1{display:inline-block;box-sizing:border-box;margin-left:2.5%;margin-top:5%;font-weight:600;font-size:.37333rem;line-height:.53333rem;color:#ff7214;border-bottom:.08rem solid #ff7214;}
.balaceWrap .listArr{padding:2.5%;box-sizing:border-box;margin-top:2%;margin-bottom:1.33333rem;}
.balaceWrap .listArr>view{background:#fff;padding:4% 2%;box-sizing:border-box;border-bottom:.02667rem solid #eee;}
.balaceWrap .listArr>view>view{display:-webkit-box;display:-webkit-flex;display:flex;-webkit-box-pack:justify;-webkit-justify-content:space-between;justify-content:space-between;}
.balaceWrap .listArr>view>view:first-of-type{font-size:.48rem;margin-bottom:3%;}
.balaceWrap .listArr>view>view:nth-of-type(2){font-size:.26667rem;color:#888;}
.balaceWrap .formWrap{margin-top:.26667rem;}
.balaceWrap .formWrap .wrap{width:90%;margin-left:5%;background:#fff;border-radius:.13333rem;display:-webkit-box;display:-webkit-flex;display:flex;-webkit-justify-content:space-around;justify-content:space-around;padding:.66667rem 0 .4rem;}
.balaceWrap .formWrap .wrap .title{width:50%;text-align:center;}
.balaceWrap .formWrap .wrap .title .titleTop{font-size:.32rem;color:#484848;font-weight:400;}
.balaceWrap .formWrap .wrap .title .allMoney{font-size:.48rem!important;font-weight:700!important;margin-bottom:.4rem!important;}
.balaceWrap .formWrap .wrap .title div{font-size:.48rem;font-weight:700;margin-bottom:.4rem;}
.balaceWrap .formWrap .wrap .title div:nth-of-type(2){font-size:.32rem;color:#484848;font-weight:400;}
.balaceWrap .formWrap .submit{width:92%;margin:.8rem 4% 0;}
</style>
