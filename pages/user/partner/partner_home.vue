<template>
	<view>
		<view id="app">
			<view class="pb50 mine">
				<view class="my-info padding margin-bottom">
					<view class="my-content flex-jb">
						<view class="left"><img :src="shop_customer.headimgurl" class="my-avatar">
							<view class="my-name ft22">{{shop_customer.real_name}} <view class="ft14" style="margin-top: 7px;">UID：{{shop_customer.user_id}}</view>
							</view><img src="../../../static/img/vip.png" class="vipIcon">
						</view>
            <img class="setting padding-right" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAAEgBckRAAAAAXNSR0IArs4c6QAAAERlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAA6ABAAMAAAABAAEAAKACAAQAAAABAAAAMKADAAQAAAABAAAAMAAAAADbN2wMAAAEiklEQVRoBc2Zu25UMRCGk3BpEAV0IMRKEUSAgAoJCmjIOxCeAgra8BDUhDcgBApegAokCq4SBZckXDqggA5xme+wY816x/bx2ZNNRpp4PPN7PL4ce7yZmUnQrNH/NfKsGqyysc8ZFKICgzDWIiAEbY1WHzkdVkErL6CjiXWBLtBhkayxkbMtaPpi2Mq2RB9oXSSMv4S1ixGwjmNDAEeFc/RcjHsUgEc8Kat+r9FhO6kGBWoJELotrDrKTZRKx0WwxlgGt1/BWr4WAeCpoQKP1MeAQ3tT2K2hk2LtI7KGsSjaFWGtB1DsAYBHAUf38H3hFBgH2O4i7BL+I3yCSoGYiIOK0VgpX6pSSqtHDmQNQSnCQ+Ex2yBSWk8W3OgZvQVINUuXrDX2ZuvMYkNhfof1VG8BZ7fBsE1wFEDWkJNxppvxmwMciE7DXnLsRdWacaCOcmXRoQUsVzrXjq2PEVmnQoF9lbP68Rwa6c6vvBI1Cwlf8CFj2mtWwzefitzirPyupo09UOKOzluvRo5xth5gDNkacjIRxx94Dv9Je2Ef54BdberfLWudhvPB9eYoV0VX04njoqxifW4JX09AP4v+YsLWWk0nHqUOPg/r6uzCDxwEByBTyCnQqbN4/vlOyGn4IONsZEN01RR3kKtX76BSJuN15o6Ai9+jr56yoCOBeJTCcFKy70n7vOhqdFxU68Jh4WvOopqO2F0N8SHVNKzBNsN4P+yoVHDJMFqYKS3RdwGEaSJzy0WmSbR1SlKXasN3MkYpMHdAilJtLmuDMARVOOUbR1dSuW1S0aD3iGs01YZjZYQ2pZYCo+cBYyl+AXltB9qAM90DeDru41wmEbdhxzUXRmzoq47/hvpyaP1cUeeU9un2QOoWWCMvWKc5uUsnOX+urSbyZ64HUbb50FJtrf6trVg51YFdE/AfhfWgo9TnNzYo/BLwv9r+LzkP34lH5Eoc9c1e9wDoUldmCm/1OCaAG8J3hH8LPxFuQwR3T3gg/FOYGZoKsTTchKkNxpGWWw6WLnfs4TteflH1S/zMkRrApPrV2lBTH0HOz7GccUIb6eSWEgnupLNcas8h25m8/cfxPo3A44ExEG9FvBibAdvHUuxsp9WJdYQ4DndakKV4iDncTvxYwcuxT+I5oLkpv8nO9+lcfH0RPmJ9DqSSO6NLM4Kd1JV0NUXYwLTxlcIQ4yDVAfoV4VTjnJ4kvi3lEv5cH8RWJPuPlZwzayOXryXaWB9t5LFt7l1kuVQgFWSb/zvEbbu0KcYGgGdtm9mIMTyVc/tfBwAm96yO/do6sY0NglUgO9QfxWyDLjLBed8Duq6Bx3EQKzHP7ZY//HI0L3xAuA86LU4e9+Eo44NYiZnYGyK3z6XJ8Qxsd51Ym4eOfe2wlVjifcJPhXnsMMqzwttJ/G/6gzAPpnPCP4TPCDOJVXRT0NOa+eWqyCrAC1MYhJeBVoRYhm5lar1W7n5yxIa4yG0lzmoe+YvC3JwwMmlA6Y5ZF8yWEx/7VeH41OJsHrToHUx85+BrSRjf20KcZjWdg7UnYOeg/wHO3QBAnaFv1wAAAABJRU5ErkJggg==" @click="NavTo('/pages/setting/index')">
					</view>
				</view>
				<view class="my-wallet">
					<view class="line1 ft11 flex-jb" @click="NavTo('/pages/user/partner/account_query')">
						<view>账户余额
							<p class="ft32">{{shop_customer.money}}</p>
						</view>
						<p class="text">我的钱包</p>
					</view>
					<view class="line2 flex-jb ft10">
						<view>
							我的积分
							<span class="icon icon-right-down"></span>
							<p class="ft18">{{shop_customer.integral}}</p>
						</view>
						<view class="van-hairline--left">
							分享的优惠券
							<span class="icon icon-right-down"></span>
							<p class="ft18">{{share_coupons_num}}</p>
						</view>
					</view>
				</view>
				<view id="function">
					<view class="vip99 is99 flex-jb">
						<view class="left flex-jb"><img src="../../../static/img/vip.png">
							<view class="ft14"><span>欢迎回来！</span>
								<p class="bold">共享合伙人</p>
							</view>
							<p class="ft13 bcG cfff">领取权益</p>
						</view>
						<view class="right flex"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADgAAAA4CAYAAACohjseAAAACXBIWXMAABYlAAAWJQFJUiTwAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAGsSURBVHgB7ZmBcYMwDABFJ0g3oKN0knSFTtBukm6SETKC2YBsoIrDvVISalmSMbT6Ox93CUh6zhhsAziO4ziOUw1EfKHWYz6B2jEVv4HKDIXSoQUZ16ZpHn874QHqcwA5yWu3IPhKrYP/SnxGF4E9k5IzFaRYB2rv1M4oI3BGvRw5M0GK08YCtfTMfEtyx/kPYIGR3EBg5FqUi//bCiKzqzDoMdFFU3KlBC+zmCdqmnfXUp6kXDzPXHBOC8Zw5e7VA1rMA97GZ8sVqcc84M/YWXJF6jEP+B03Wy5eN515JEdlTiHmglK5ybUBGaMytxhTQY1cESwFNycXizIR3KRcLEwtuFm5WJxKEOWj5ddaTSh6IzSCqBstw+R81ixEhFQQld1SmjcbhWCQymnyZqMQ7KVymrzZKARVXxxWgsmF33lwWmhdZbHYKu8W1kWL4oJ7xwX3jgvunWxBLLAmeidHC2uBt5stp5IF4LjJ8zHLeYFSUPA3rI94Psj5VBu65HAHW6hDR19pTyAk+QxS8CsdnqHONnMXc68DjjOEC5bnjOOjUXxAcxzHcZy/zCd8furmFuEVygAAAABJRU5ErkJggg=="
							 class="img24">
							<p class="ft10 cfff">推广赚钱</p>
						</view>
					</view>
					<ul class="l1 flex-ja ft14 solid radius">
						<li @click="NavTo('/pages/public/join')"><img src="../../../static/img/carefreeWang_1.png">
							逍遥王
						</li>
						<li @click="NavTo('/pages/public/join')"><img src="../../../static/img/carefreeWang_2.png">
							逍遥商
						</li>
						<li @click="NavTo('/pages/public/join')"><img src="../../../static/img/carefreeWang_3.png">
							逍遥神
						</li>
					</ul>
          <img class="radius" src="../../../static/img/hd.png" alt="">
					<view class="detail99 ft10 solid radius">
						<view class="line1 flex-jb">
							<view>
								<p class="ft16 bold">共享合伙人</p>
								我的账单流水
							</view>
							<p class="ft12" @click="NavTo('/pages/user/partner/partner_accounts')">查看明细</p>
						</view>
						<view class="line2 flex-jb">
							<view>
								<p class="ft14"><span class="ft20">{{un_pay}}</span>/{{payed}}</p>
								待提现/已提现
							</view>
							<view>
								<!-- <span class="giveBtn ft13 cfff">赠送</span> -->
							<span class="ft13 cfff bcG" @click="toWithdraw">提现</span></view>
						</view>
					</view>
					<ul class="l2 flex-ja ft14 solid radius">
						<li @click="NavTo('/pages/user/partner/partner_customers')"><img src="../../../static/img/promote.png">
							我的推广
						</li>
						<li @click="NavTo('/pages/user/my_activitys')"><img src="../../../static/img/mealIcon.png">
							我的活动
						</li>
						<li @click="NavTo('/pages/user/coupons')"><img src="../../../static/img/coupon.png">
							我的卡券
						</li>
						<li @click="NavTo('/pages/user/renz')"><img src="../../../static/img/incoming.png">
							个人认证
						</li>
						<li><img src="../../../static/img/rz.png">
							车辆认证
						</li>
						<li><img src="../../../static/img/address.png">
							收货地址
						</li>
					</ul>
					<!---->
				</view>
				
				<toggle-user-home></toggle-user-home>
				
				<footnav nav="user_home"> </footnav>
			</view>
		</view>
	</view>
</template>

<script>
	import toggleUserHome from "@/components/toggle-user-home"
	export default {
		components: {
			toggleUserHome
		},
		data() {
			return {
				un_pay:0,
				payed:0,
				customer_num:0,
				share_coupons_num:0,
				shop_customer:{},
			}
		},
		onShow() {
			this.reLoadSize();
		    this.loadData();
		},
		methods: {
			async loadData(){
				var _this = this;
				await this.http.post("/partner/info",{'shop_id':1}).then(
					async r => {
						_this.un_pay = r.un_pay;
						_this.payed = r.payed;
						_this.customer_num = r.customer_num;
						_this.share_coupons_num = r.share_coupons_num;
						_this.shop_customer = r.shop_customer;
						  
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
	

	[class*=van-]:focus {
		outline: 0;
	}

	[class*=van-]:focus {
		outline: none;
	}

	ul {
		margin: 0;
		padding: 0;
		list-style: none;
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

	.van-hairline--left {
		position: relative;
	}

	.van-hairline--left:after {
		border-left-width: .02667rem;
	}


	.pb50 {
		padding-bottom: 1.33333rem;
	}

	img {
		display: block;
		width: 100%;
		font-size: 0;
	}

	.ft10 {
		font-size: .26667rem;
	}

	.ft11 {
		font-size: .29333rem;
	}

	.ft12 {
		font-size: .32rem;
	}

	.ft13 {
		font-size: .34667rem;
	}

	.ft14 {
		font-size: .37333rem;
	}

	.ft16 {
		font-size: .42667rem;
	}

	.ft18 {
		font-size: .48rem;
	}

	.ft20 {
		font-size: .53333rem;
	}

	.ft22 {
		font-size: .58667rem;
	}

	.ft32 {
		font-size: .85333rem;
	}

	.bold {
		font-weight: 600;
	}

	.bcG {
		background-color: #ff7214;
	}

	.cfff {
		color: #fff;
	}

	.img24 {
		width: .64rem;
		height: .64rem;
	}

	.flex {
		display: -webkit-box;
		display: -webkit-flex;
		display: flex;
	}

	.flex-1 {
		-webkit-box-flex: 1;
		-webkit-flex: 1;
		flex: 1;
	}

	.flex-1,
	.flex-jb {
		display: -webkit-box;
		display: -webkit-flex;
		display: flex;
	}

	.flex-jb {
		-webkit-box-pack: justify;
		-webkit-justify-content: space-between;
		justify-content: space-between;
	}

	.flex-ja {
		display: -webkit-box;
		display: -webkit-flex;
		display: flex;
		-webkit-justify-content: space-around;
		justify-content: space-around;
	}

	.flex-center {
		-webkit-box-pack: center;
		-webkit-justify-content: center;
		justify-content: center;
	}

	.flex-center {
		display: -webkit-box;
		display: -webkit-flex;
		display: flex;
		-webkit-box-align: center;
		-webkit-align-items: center;
		align-items: center;
	}

	.w-100 {
		width: 100%;
	}

	#app {
		width: 100%;
		height: 100%;
	}

	.icon {
		position: relative;
		margin-right: .69333rem;
	}

	.icon-right-down:before {
		content: "";
		position: absolute;
		left: 0;
		display: block;
	}

	.icon-right-down:before {
		top: 0;
		height: .37333rem;
		width: .37333rem;
		background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAACXBIWXMAABYlAAAWJQFJUiTwAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAACoSURBVHgB7ZQhDsMwEATXVUlDTfuI0NI+orSlxX1HP1JaHprX5A3ORjGNso7OkSLdSCuT9Xl0wIDjOM4RSCm1zJuJQjfmbguBEzRuzDTwI0jE3L3DUODHDHm4IiEjCYQQpse/NSTUDVSTkAVqSRQJ1JAoFrCW2CRgKbFZYEkin/sILEg8Su6flRJX2/C4rtT+zItpYC1Anpi/V3NUgZ65oIwOjuM4R2AE8sxNOHYcQiIAAAAASUVORK5CYII=) no-repeat;
		background-size: .37333rem .37333rem;
	}

	

	.my-info {
		height: 2.82667rem;
	  background-color: var(--Highlight-background-color);
	}
	
	.my-info .setting {
		width: .64rem;
		display: inline-block;
	}
	@media (prefers-color-scheme: dark) {
	  .my-info .setting {
	    -webkit-filter: brightness(0) invert(1);
	    filter: brightness(0) invert(1);
	  }
	}
	.my-info .my-content {
		-webkit-box-align: center;
		-webkit-align-items: center;
		align-items: center;
	}
	
	.my-info .my-content .left {
		display: -webkit-box;
		display: -webkit-flex;
		display: flex;
		-webkit-box-align: center;
		-webkit-align-items: center;
		align-items: center;
	}
	
	.my-info .my-content .left .my-avatar {
		display: inline-block;
		width: 1.33333rem;
		height: 1.33333rem;
		border-radius: 50%;
	}
	
	.my-info .my-content .left .my-name {
		margin-left: .26667rem;
		vertical-align: middle;
		font-family: PingFangSC-Semibold;
		color: var(--text-color);
	}
	
	.my-info .my-content .left .vipIcon {
		margin-left: .37333rem;
		width: .66667rem;
	}

	.my-wallet {
		margin: 0 auto;
		width: 9.41333rem;
		height: 4rem;
		color: #fff;
		background: url(../../../static/img/wallet.jpg) 50%/100%;
		box-shadow: 0 .26667rem .26667rem rgba(0, 0, 0, .1);
		border-radius: .42667rem;
	}

	.my-wallet .line1 {
		padding: .53333rem .42667rem 0 .53333rem;
	}

	.my-wallet .line1 .ft32 {
		line-height: 1.2rem;
	}

	.my-wallet .line1 .text {
		padding-top: .98667rem;
	}

	.my-wallet .line2 {
		margin-top: .53333rem;
	}

	.my-wallet .line2 view {
		width: 50%;
		height: 1.01333rem;
		padding-left: .53333rem;
	}

	.my-wallet .line2 .ft18 {
		margin-top: .08rem;
		line-height: .66667rem;
	}

	#function {
		margin: .26667rem auto;
		width: 9.2rem;
	}

	#function .vip99 {
		margin: .26667rem auto;
		width: 9.36rem;
		height: 1.76rem;
		border-radius: .88rem;
	}

	#function .is99 {
		box-sizing: border-box;
		padding-right: .16rem;
	}

	#function .is99 .left {
		-webkit-box-align: center;
		-webkit-align-items: center;
		align-items: center;
		width: 6.64rem;
		padding: .26667rem;
	}

	#function .is99 .left img {
		width: 1.22667rem;
		height: 1.22667rem;
	}

	#function .is99 .left .ft14 {
		line-height: .53333rem;
	}

	#function .is99 .left .ft13 {
		margin-top: .29333rem;
		width: 1.89333rem;
		height: .64rem;
		line-height: .64rem;
		text-align: center;
		border-radius: .32rem;
	}

	#function .is99 .right {
		width: 1.76rem;
		-webkit-box-orient: vertical;
		-webkit-box-direction: normal;
		-webkit-flex-direction: column;
		flex-direction: column;
		-webkit-box-pack: center;
		-webkit-justify-content: center;
		justify-content: center;
		-webkit-box-align: center;
		-webkit-align-items: center;
		align-items: center;
	}

	#function .is99 .right img {
		margin-bottom: .13333rem;
	}

	#function .is99 {
		background: url(../../../static/img/generalize.png) no-repeat 0/auto 100%;
	}

	#function ul {
		width: 100%;
		background: var(--Highlight-background-color);
		color:  var(--text-color);
	}

	#function .l1 {
		margin-bottom: .26667rem;
		padding: .4rem 0 .32rem;
		text-align: center;
	}

	#function .l1 li img {
		margin: 0 auto;
		padding-bottom: .26667rem;
		width: 1.52rem;
		height: 1.52rem;
	}

	#function .detail99 {
		margin: .26667rem auto;
		padding: .4rem .34667rem;
		height: auto;
		background-color: var(--Highlight-background-color);
		color: var(--text-color);
	}

	#function .detail99 .line1 {
		margin-bottom: .26667rem;
		-webkit-box-align: center;
		-webkit-align-items: center;
		align-items: center;
	}

	#function .detail99 .line1 .ft16 {
		margin-bottom: .13333rem;
		color: var(--text-color);
	}

	#function .detail99 .line2 {
		-webkit-box-align: center;
		-webkit-align-items: center;
		align-items: center;
	}

	#function .detail99 .line2 .ft14 {
		line-height: .74667rem;
		color: var(--hover-color);
	}

	#function .detail99 .line2 .ft13 {
		display: inline-block;
		margin-left: .4rem;
		width: 1.49333rem;
		line-height: .64rem;
		border-radius: .32rem;
		text-align: center;
	}

	#function .detail99 .line2 .giveBtn {
		background: #ff4646;
	}

	#function .l2 {
		padding: .48rem 0;
		-webkit-flex-wrap: wrap;
		flex-wrap: wrap;
	}

	#function .l2 li {
		padding: 0 .66667rem;
		margin: .32rem 0;
	}

	#function .l2 li img {
		margin: 0 auto;
		width: .85333rem;
		height: .85333rem;
		padding-bottom: .26667rem;
	}
</style>
