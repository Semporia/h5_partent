<template>
  <view>
    <view id="app">
      <view role="feed" class="mealList van-list">

        <view class="mealCard" v-for="(item,index) in activitys" :key="index" @click="goDetail(item)"><img :src="item.pic"
            alt="">
          <view class="mealTitle padding-top padding-right padding-bottom-xs padding-left text-df">
            <view class="title">{{item.title}}</view>
          </view>
		  <view class="padding-right padding-bottom-xs padding-left text-content text-color">{{item.shop_name}}</view>
          <view class="padding-right padding-bottom-xs padding-left text-content text-color text-xs">
            <icon class="icon-dingwei text-blue" type=""></icon>{{item.address}}
          </view>
          <view class="padding-right padding-left text-content">
            <view class="text-xs text-color">
              <icon class="icon-dian text-green" type=""></icon>开始时间：{{item.start_at}}
            </view>
            <view class="text-xs text-color">
              <icon class="icon-dian text-orange" type=""></icon>结束时间：{{item.end_at}}
            </view>
          </view>
          <view class="flex margin padding-top text-content solid-top">
            <view class="flex-sub text-color text-bold"><icon class="icon-tianjia text-orange" type=""></icon>限量{{item.can_buy_num}}张</view>
            <view class="text-right hover-color text-bold">进入活动 <icon class="icon-jinru" type=""></icon></view>
          </view>
        </view>


<!--        <view class="mealCard" @click="NavTo('/pages/public/activity_detail')"><img src="@/static/img/hh2.png" alt="">
          <view class="mealTitle padding-top padding-right padding-bottom-xs padding-left text-df">
            <view class="title">Test， 梦想合伙人（限时限5人）</view>
          </view>
          <view class="padding-right padding-bottom-xs padding-left text-content text-color">每天11点开抢</view>
          <view class="padding-right padding-left text-content">
            <view class="text-xs text-color">
              <icon class="icon-dian text-green" type=""></icon>2021年01月08日-2021年01月20日
            </view>
            <view class="text-xs text-color">
              <icon class="icon-dian text-orange" type=""></icon>宁波市海曙区集士港镇集仕芯谷B-401
            </view>
          </view>
          <view class="flex margin padding-top text-content solid-top">
            <view class="flex-sub text-color text-bold"><icon class="icon-tianjia text-orange" type=""></icon>限5人报名参加</view>
            <view class="text-right hover-color text-bold">进入活动 <icon class="icon-jinru" type=""></icon></view>
          </view>
        </view>

        <view class="mealCard" @click="NavTo('/pages/public/activity_detail')"><img src="https://js.ibaotu.com/act/21/01/04/5ff2731249abc.jpg"
            alt="">
          <view class="mealTitle padding-top padding-right padding-bottom-xs padding-left text-df">
            <view class="title">甬士健身 梦想合伙人计划</view>
          </view>
          <view class="padding-right padding-bottom-xs padding-left text-content text-color">每天11点开抢</view>
          <view class="padding-right padding-left text-content">
            <view class="text-xs text-color">
              <icon class="icon-dian text-green" type=""></icon>2021年01月08日-2021年01月20日
            </view>
            <view class="text-xs text-color">
              <icon class="icon-dian text-orange" type=""></icon>宁波市海曙区集士港镇集仕芯谷B-401
            </view>
          </view>
          <view class="flex margin padding-top text-content solid-top">
            <view class="flex-sub text-color text-bold"><icon class="icon-tianjia text-orange" type=""></icon>限5人报名参加</view>
            <view class="text-right hover-color text-bold">进入活动 <icon class="icon-jinru" type=""></icon></view>
          </view>
        </view>

        <view class="mealCard" @click="NavTo('/pages/public/activity_detail')"><img src="https://js.ibaotu.com/act/21/01/04/5ff2736c7a107.jpg"
            alt="">
          <view class="mealTitle padding-top padding-right padding-bottom-xs padding-left text-df">
            <view class="title">甬士健身 梦想合伙人计划</view>
          </view>
          <view class="padding-right padding-bottom-xs padding-left text-content text-color">每天11点开抢</view>
          <view class="padding-right padding-left text-content">
            <view class="text-xs text-color">
              <icon class="icon-dian text-green" type="" type=""></icon>2021年01月08日-2021年01月20日
            </view>
            <view class="text-xs text-color">
              <icon class="icon-dian text-orange" type="" type=""></icon>宁波市海曙区集士港镇集仕芯谷B-401
            </view>
          </view>
          <view class="flex margin padding-top text-content solid-top">
            <view class="flex-sub text-color text-bold"><icon class="icon-tianjia text-orange" type="" type=""></icon>限5人报名参加</view>
            <view class="text-right hover-color text-bold">进入活动 <icon class="icon-jinru" type="" type=""></icon></view>
          </view>
        </view>
        <view class="mealCard" @click="NavTo('/pages/public/activity_detail')"><img src="https://js.ibaotu.com/act/21/01/04/5ff2737019170.jpg" alt="">
          <view class="mealTitle padding-top padding-right padding-bottom-xs padding-left text-df">
            <view class="title">甬士健身 梦想合伙人计划</view>
          </view>
          <view class="padding-right padding-bottom-xs padding-left text-content text-color">每天11点开抢</view>
          <view class="padding-right padding-left text-content">
            <view class="text-xs text-color">
              <icon class="icon-dian text-green" type=""></icon>2021年01月08日-2021年01月20日
            </view>
            <view class="text-xs text-color">
              <icon class="icon-dian text-orange" type=""></icon>宁波市海曙区集士港镇集仕芯谷B-401
            </view>
          </view>
          <view class="flex margin padding-top text-content solid-top">
            <view class="flex-sub text-color text-bold"><icon class="icon-tianjia text-orange" type=""></icon>限5人报名参加</view>
            <view class="text-right hover-color text-bold">进入活动 <icon class="icon-jinru" type=""></icon></view>
          </view>
        </view> -->

        <view class="van-list__finished-text padding-bottom text-center">————————· 我是有底线的 ·————————</view>
        <view class="van-list__placeholder padding-bottom"></view>
      </view>


      <footnav nav=""> </footnav>

    </view>
  </view>
</template>

<script>
  export default {
    data() {
      return {
        page: 1,
        activitys: [],
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
		this.activitys =[];
		this.loadData();
	},
	onReachBottom() {
		this.page++;
		this.loadData();
	},
    methods: {
      async loadData() {
      		
      		await this.http.post("/index/getActivitys", {
      			'shop_id': 1,
				page:this.page,
      		}).then(
      			async r => {
					if(this.page>r.page_info.total_page){
						uni.showToast({
							title:'没有更多信息'
						})
					}
      				this.activitys = this.activitys.concat(r.activitys);
      			}
      		)
      	}
      ,
      goDetail(item) {
        this.NavTo('/pages/public/activity_detail?id=' + item.id);
      }
    }
  }
</script>

