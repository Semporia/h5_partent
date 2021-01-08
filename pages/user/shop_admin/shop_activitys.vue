<template>
	<view>
		<view id="app">
			<view role="feed" class="mealList van-list">
				<view class="mealCard" @click="NavTo('/pages/public/activity_detail')"><img src="@/static/img/hd1.png"
					 alt="">
					<view class="mealTitle">
						<view class="title left">甬士健身 全民健身体验周</view>
						<!---->
						<view class="title right"></view>
					</view>
				</view>
				
				
				<view class="mealCard" @click="NavTo('/pages/public/activity_detail')"><img src="@/static/img/hh2.png"
					 alt="">
					<view class="mealTitle">
						<view class="title left">甬士健身 梦想合伙人计划</view>
						<!---->
						<view class="title right"></view>
					</view>
				</view>
				
				<view class="van-list__finished-text">没有更多了</view>
				<view class="van-list__placeholder"></view>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {

			}
		},
		onShow() {
			this.reLoadSize();
		},
		methods: {

		}
	}
</script>

<style>

	[class*=van-]:focus{outline:0;}
	.van-list__finished-text{color:#969799;font-size:.37333rem;line-height:1.33333rem;text-align:center;}
	.van-list__placeholder{height:0;pointer-events:none;}
	[class*=van-]:focus{outline:none;}

	*{margin:0;padding:0;}
	*{touch-action:pan-y;}
	img{display:block;width:100%;font-size:0;}
	#app{width:100%;height:100%;}

	.mealList{padding:0 2%;margin-top:.26667rem;box-sizing:border-box;background:#f6f6f6;}
	.mealList .mealCard{margin-bottom:.4rem;border-radius:.13333rem;overflow:hidden;padding:.13333rem .21333rem;background:#fff;}
	.mealList .mealCard .mealTitle{display:-webkit-box;display:-webkit-flex;display:flex;-webkit-box-pack:justify;-webkit-justify-content:space-between;justify-content:space-between;}
	.mealList .mealCard .mealTitle .title{width:50%;font-size:.37333rem;text-indent:.13333rem;padding:.13333rem 0;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;font-weight:700;}
	.mealList .mealCard .mealTitle .right{font-size:.29333rem;text-align:right;}
</style>
