<template>
	<view>
		<view id="app">
			<view id="myGeneralize">


				<view class="fansWrap">
					<!-- <p class="ft18">店铺的顾客</p> -->
					<ul class="fansList">
						<li v-for="(item,index) in shop_customers" class="fans flex-jb van-hairline--bottom"   @click="NavTo('/pages/user/partner/partner_accounts')" >
							<view class="left"><img :src="item.headimgurl">
								<p class="ft18 van-ellipsis">{{item.nickname}}</p>
							</view>
							<view class="right ft12">
								<p class="ft10 ">135.92 / 2536.00</p>
								<p class="ft10 ">收益率：{{item.partner_point}} %</p>
								<p class="icon-link">{{item.created_at}}</p>
							</view>
						</li>
						
					</ul>
				</view>
				<!---->
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				shop_customers:[],
				page:1,
			}
		},
		onShow() {
			this.reLoadSize();
		},
		onLoad() {
			this.loadData();
		},
		onPullDownRefresh() {
			this.page = 1;
			this.shop_customers =[];
			this.loadData();
		},
		onReachBottom() {
			this.page++;
			this.loadData();
		},
		methods: {
			async loadData() {
				await this.http.post("/shop_admin/getPartners", {
					'shop_id': 1,
					page:this.page,
				}).then(
					async r => {
						if(this.page>r.page_info.total_page){
							uni.showToast({
								title:'没有更多信息'
							})
						}
						this.shop_customers = this.shop_customers.concat(r.shop_customers);
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

	.van-icon {
		position: relative;
		font: normal normal normal .37333rem/1 vant-icon;
		font-size: inherit;
		text-rendering: auto;
		-webkit-font-smoothing: antialiased;
	}

	.van-icon,
	.van-icon:before {
		display: inline-block;
	}

	.van-icon-question:before {
		content: "\F0AA";
	}

	[class*=van-]:focus {
		outline: none;
	}

	ul {
		margin: 0;
		padding: 0;
		list-style: none;
	}

	.van-ellipsis {
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
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

	.ft12 {
		font-size: .32rem;
	}

	.ft14 {
		font-size: .37333rem;
	}

	.ft18 {
		font-size: .48rem;
	}

	.ft28 {
		font-size: .74667rem;
	}

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

	#app {
		width: 100%;
		height: 100%;
	}

	#myGeneralize .van-hairline--bottom:after {
		border-color: #ebebeb;
	}

	#myGeneralize .codeWrap {
		width: 8.45333rem;
		margin: .4rem auto;
		padding: .53333rem .48rem;
		border-radius: .18667rem;
		background: var(--Highlight-background-color);
	}

	#myGeneralize .codeWrap .code {
		margin-top: .26667rem;
		color: #ff3c46;
	}

	#myGeneralize .fansWrap {
		background: var(--Highlight-background-color);
		padding: .53333rem .42667rem;
	}

	#myGeneralize .fansWrap .fansList {
		color:  var(--text-color);
	}

	#myGeneralize .fansWrap .fansList .fans {
		padding: .53333rem 0;
	}

	#myGeneralize .fansWrap .fansList .fans .left img {
		display: inline-block;
		width: 1.06667rem;
		height: 1.06667rem;
		margin-right: .26667rem;
		border-radius: 50%;
		vertical-align: middle;
	}

	#myGeneralize .fansWrap .fansList .fans .left .ft18 {
		display: inline-block;
		width: 4.13333rem;
		vertical-align: middle;
	}

	#myGeneralize .fansWrap .fansList .fans .right {
		vertical-align: middle;
		color:  var(--text-color);
	}

	#myGeneralize .fansWrap .fansList .fans .right .icon-link {
		line-height: 1.06667rem;
	}

	#myGeneralize .fansWrap .fansList .fans .right .icon-link:before {
		content: " ";
		display: inline-block;
		width: .42667rem;
		height: .42667rem;
		margin-right: .21333rem;
		vertical-align: middle;
		background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACQAAAAkCAYAAADhAJiYAAAAAXNSR0IArs4c6QAAAERlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAA6ABAAMAAAABAAEAAKACAAQAAAABAAAAJKADAAQAAAABAAAAJAAAAAAqDuP8AAADdElEQVRYCe2WXWiOYRjH3yGztSGN+Yhmy8QIWU0NZQfSciCJciBSvqIcKHM0tJIShQPlZAeSEycU2kSafM5nhORjpVmEbCSf8/s/e67t3uN+tmeyA/Ve9Xuu67q/3v973ff9vG8qlbZ0BdIV6N8KZPTv8sHqBTyLw895gm8KY6/rT0E5fOImqIh8cj35EfgcaQ/Sgb7GhG1jGJcNvoXVvhvKIGpFNJRCA3yLdva1QhpfCashF2Qf4ChcUIJpzD4oURJaC74VJsCQsO0ZvgrawjxwfamQxmqB5ZAZzO54ZOHKYTTcgF/wCtTWDjVwGM7CKdD4yTACZkO3SiUVpHHbYT7EWSEdU+EqNMM1uBd6XGDfed6EQTANJEpz6iCwJIJ8YpqYfQ4egL6xFpapSnPgOrwGVcpn92nU+dK8USCR7yDVmyCfGJV+J9yGu6D8B8wE2XBQJevhj0NLm0xbmQ+qkuwL3FIwQI8Y84k5w9iDIAFmWvwEHLMGfB6sd3JfaIdbfWNtQJygODGHmCgBMp2DxUHU8TiOe+Pk84jjdmAwfdpaM1UoMJ+gJGI0eQVshq2gObpduspmmQQjLYn4DeTaMrNGC6KCkorR/AXhIovwG8N4WOjldKPeOrmF6wgqLcE/houWRwVJuXu1dWbcbbJ5Ej7OEry2T7YX9Hsl0037GURdj1WES7vS1AvialB1A9PCZjrxWyzB60rXgJ0ZpytoW0hDTtioqysBzXAe9EV1yDvPBrG2WILMJKYKPlqDvFuhuW4H8UnwibFhegGaDSXYD3qv6AbWwnswW0KwxhK8V4z6XUGdVy+cqBdbT1ZLZ4szQNVa6+QW6rzoKJjFitEAd8smkU+xWfiH8NLJo2EWDZehHLLDzkK8fp+UK14Jy8CsRzEa5ArSfutc6NdaVgR62+q2RG06DQdA23YaXFG66qVQBuPBrFcxGugK0hVV2a1KucQSdQnawUwfuAd0bnQjr0BUFE3dLJEYzXAFKb8D+uM1UQmmc1UAjaBKzYJdoMMr+wp10ATaPn2BfHCtgUS3tdVtjIszPB066NugwumTmDYwIer6BDvgqZLQtN4MKAbN0UvvESQ2nyBN9olyF/WJcfv/Oo5umS2kM6MDq29ZAu44fetq0Ln45xZXIfeD8kh00PU79RwkqPNVT5y2dAXSFfivKvAbwGiphhS0scYAAAAASUVORK5CYII=) no-repeat;
		background-size: 100%;
	}

	/*! CSS Used fontfaces */
	@font-face {
		font-weight: 400;
		font-family: vant-icon;
		font-style: normal;
		font-display: auto;
		src: url(../../../static/fonts/vant-icon-db1de1.woff2) format("woff2"), url(../../../static/fonts/vant-icon-db1de1.woff) format("woff"), url(../../../static/fonts/vant-icon-db1de1.ttf) format("truetype");
	}
</style>
