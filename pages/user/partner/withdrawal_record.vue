<template>
	<view>
		<view id="app">
			<view role="feed" class="mealList van-list">
				<view v-for="(item,index) in  withdraws" :key="index" class="mealCard">
					<view  class="list">
						<view>提现</view>
						<view>-{{item.money}}</view>
					</view>
					<view class="list">
						<view>{{item.created_at}}</view>
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
				withdraws:[],
			}
		},
		onShow() {
			this.reLoadSize();
			this.loadData();
		},
		methods: {
			async loadData(){
				var _this = this;
				await this.http.post("/partner/getWithdraws",{'shop_id':1}).then(
					async r => {
						_this.withdraws = r.withdraws;  
				    }
				)
			}
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
