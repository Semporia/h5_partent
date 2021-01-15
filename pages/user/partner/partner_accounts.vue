
<template>
	<view>
		<view id="app">
			<view id="generalizeRecord">
				<view role="feed" class="van-list" aria-busy="true">
					
					
					<view class="generalize ft14 van-hairline--bottom" v-for="(item,index) in shop_accounts" :key="index">
						<view class="line1 van-clearfix">
							<view class="left">
								{{item.product_name}}
								<span class="greenFc">推广成功</span></view>
							<view class="right ft16">+ ¥{{item.partner_money}}</view>
						</view>
						<view class="line2 van-clearfix">
							<view class="left"><img :src="item.headimgurl"><span
								 class="ft12">{{item.nickname}}</span></view>
							<view class="right ft10">
								{{item.created_at}}
								<span class="greenFc">已入账</span></view>
						</view>
					</view>
					
					
					
					<view class="van-list__finished-text">没有更多了</view>
					<view class="van-list__placeholder"></view>
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
			async loadData() {
				var _this = this;
				await this.http.post("/partner/getAccounts", {
					'shop_id': 1
				}).then(
					async r => {
						_this.shop_accounts = r.shop_accounts;
						_this.un_pay = r.un_pay;
						_this.payed = r.payed;
					}
				)
			},
		}
	}
</script>

<style>
  [class*=van-]:focus {
    outline: 0;
  }

  .van-list__finished-text {
    color: #969799;
    font-size: .37333rem;
    line-height: 1.33333rem;
    text-align: center;
  }

  .van-list__placeholder {
    height: 0;
    pointer-events: none;
  }

  [class*=van-]:focus {
    outline: none;
  }

  .van-clearfix:after {
    display: table;
    clear: both;
    content: "";
  }

  [class*=van-hairline]:after {
    position: absolute;
    box-sizing: border-box;
    content: " ";
    pointer-events: none;
    top: -50%;
    right: -50%;
    bottom: -50%;
    left: -50%;
    border: 0 solid #ebedf0;
    -webkit-transform: scale(.5);
    transform: scale(.5);
  }

  .van-hairline--bottom {
    position: relative;
  }

  .van-hairline--bottom:after {
    border-bottom-width: .02667rem;
  }

  /*! CSS Used from: https://www.czg365.com/static/css/app.655d1730.css */
  * {
    margin: 0;
    padding: 0;
  }

  * {
    touch-action: pan-y;
  }

  img {
    display: block;
    width: 100%;
    font-size: 0;
  }

  .ft10 {
    font-size: .26667rem;
  }

  .ft12 {
    font-size: .32rem;
  }

  .ft14 {
    font-size: .37333rem;
  }

  .ft16 {
    font-size: .42667rem;
  }

  #app {
    width: 100%;
    height: 100%;
  }

  /*! CSS Used from: https://www.czg365.com/static/css/chunk-685c39eb.af894cc4.css */
  #generalizeRecord {
    color: #343434;
    background-color: var(--Highlight-background-color);
  }

  #generalizeRecord .greenFc {
    color: #1ba531;
  }

  #generalizeRecord .generalize {
    height: 1.22667rem;
    padding: .53333rem .4rem .26667rem;
  }

  #generalizeRecord .generalize .line1 {
    line-height: .58667rem;
  }

  #generalizeRecord .generalize .line1 .left {
    float: left;
  }

  #generalizeRecord .generalize .line1 .left .greenFc {
    margin-left: .24rem;
  }

  #generalizeRecord .generalize .line1 .right {
    float: right;
    color: #151515;
  }

  #generalizeRecord .generalize .line2 {
    line-height: .58667rem;
  }

  #generalizeRecord .generalize .line2 .left {
    float: left;
  }

  #generalizeRecord .generalize .line2 .left img {
    display: inline-block;
    margin-right: .18667rem;
    width: .58667rem;
    height: .58667rem;
    border-radius: 50%;
    vertical-align: middle;
  }

  #generalizeRecord .generalize .line2 .right {
    float: right;
  }

  #generalizeRecord .generalize .line2 .right .greenFc {
    margin-left: .32rem;
  }
</style>
