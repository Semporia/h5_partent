<template>
	<view>
		<view id="app">
			<view role="feed" class="mealList van-list">
				<view class="mealCard">
					<view class="list">
						<view>提现</view>
						<view>-396</view>
					</view>
					<view class="list">
						<view>2020-12-16 20:49:15</view>
						<view>已提现</view>
					</view>
				</view>
				<view class="mealCard">
					<view class="list">
						<view>提现</view>
						<view>-99</view>
					</view>
					<view class="list">
						<view>2020-12-15 16:23:47</view>
						<view>已提现</view>
					</view>
				</view>
				<view class="mealCard">
					<view class="list">
						<view>提现</view>
						<view>-99</view>
					</view>
					<view class="list">
						<view>2020-12-14 21:49:13</view>
						<view>已提现</view>
					</view>
				</view>
				<view class="mealCard">
					<view class="list">
						<view>提现</view>
						<view>-99</view>
					</view>
					<view class="list">
						<view>2020-12-12 21:36:27</view>
						<view>已提现</view>
					</view>
				</view>
				<view class="mealCard">
					<view class="list">
						<view>提现</view>
						<view>-198</view>
					</view>
					<view class="list">
						<view>2020-12-10 15:59:19</view>
						<view>已提现</view>
					</view>
				</view>
				<view class="mealCard">
					<view class="list">
						<view>提现</view>
						<view>-99</view>
					</view>
					<view class="list">
						<view>2020-12-08 22:20:22</view>
						<view>已提现</view>
					</view>
				</view>
				<view class="mealCard">
					<view class="list">
						<view>提现</view>
						<view>-396</view>
					</view>
					<view class="list">
						<view>2020-12-08 20:21:47</view>
						<view>已提现</view>
					</view>
				</view>
				<view class="mealCard">
					<view class="list">
						<view>提现</view>
						<view>-99</view>
					</view>
					<view class="list">
						<view>2020-12-08 10:20:58</view>
						<view>已提现</view>
					</view>
				</view>
				<view class="mealCard">
					<view class="list">
						<view>提现</view>
						<view>-297</view>
					</view>
					<view class="list">
						<view>2020-12-07 16:18:45</view>
						<view>已提现</view>
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
#app{width:100%;height:100%;}

.mealList{padding:0 2%;margin-top:.26667rem;box-sizing:border-box;background:#f6f6f6;border-radius:.13333rem;overflow:hidden;}
.mealList .mealCard{overflow:hidden;padding:.4rem .21333rem;background:#fff;border-bottom:.02667rem solid #e3e3e3;}
.mealList .mealCard .list{display:-webkit-box;display:-webkit-flex;display:flex;-webkit-box-pack:justify;-webkit-justify-content:space-between;justify-content:space-between;}
.mealList .mealCard .list:first-of-type{font-size:.48rem;font-weight:700;}
.mealList .mealCard .list:nth-of-type(2){font-size:.32rem;color:#888;margin-top:.13333rem;}
</style>
