<template>
  <view>
    <view id="app">
      <view role="feed" class="mealList van-list">

        <view class="mealCard" v-for="(item,index) in activitys" :key="index" @click="goDetail(item)"><img :src="item.pic"
            alt="">
          <view class="mealTitle padding-top padding-right padding-bottom-xs padding-left text-df">
            <view class="title">{{item.title}}</view>
          </view>
          <view class="padding-right padding-bottom-xs padding-left text-content text-color">每天11点开抢</view>
          <view class="padding-right padding-left text-content">
            <view class="text-xs text-color">
              <icon class="icon-dian text-green"></icon>2021年01月08日-2021年01月20日
            </view>
            <view class="text-xs text-color">
              <icon class="icon-dian text-orange"></icon>宁波市海曙区集士港镇集仕芯谷B-401
            </view>
          </view>
          <view class="flex margin padding-top text-content solid-top">
            <view class="flex-sub text-color text-bold"><icon class="icon-tianjia text-orange"></icon>限5人报名参加</view>
            <view class="text-right hover-color text-bold">进入活动 <icon class="icon-jinru"></icon></view>
          </view>
        </view>


        <view class="mealCard" @click="NavTo('/pages/public/activity_detail')"><img src="@/static/img/hh2.png" alt="">
          <view class="mealTitle padding-top padding-right padding-bottom-xs padding-left text-df">
            <view class="title">Test， 梦想合伙人（限时限5人）</view>
          </view>
          <view class="padding-right padding-bottom-xs padding-left text-content text-color">每天11点开抢</view>
          <view class="padding-right padding-left text-content">
            <view class="text-xs text-color">
              <icon class="icon-dian text-green"></icon>2021年01月08日-2021年01月20日
            </view>
            <view class="text-xs text-color">
              <icon class="icon-dian text-orange"></icon>宁波市海曙区集士港镇集仕芯谷B-401
            </view>
          </view>
          <view class="flex margin padding-top text-content solid-top">
            <view class="flex-sub text-color text-bold"><icon class="icon-tianjia text-orange"></icon>限5人报名参加</view>
            <view class="text-right hover-color text-bold">进入活动 <icon class="icon-jinru"></icon></view>
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
              <icon class="icon-dian text-green"></icon>2021年01月08日-2021年01月20日
            </view>
            <view class="text-xs text-color">
              <icon class="icon-dian text-orange"></icon>宁波市海曙区集士港镇集仕芯谷B-401
            </view>
          </view>
          <view class="flex margin padding-top text-content solid-top">
            <view class="flex-sub text-color text-bold"><icon class="icon-tianjia text-orange"></icon>限5人报名参加</view>
            <view class="text-right hover-color text-bold">进入活动 <icon class="icon-jinru"></icon></view>
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
              <icon class="icon-dian text-green"></icon>2021年01月08日-2021年01月20日
            </view>
            <view class="text-xs text-color">
              <icon class="icon-dian text-orange"></icon>宁波市海曙区集士港镇集仕芯谷B-401
            </view>
          </view>
          <view class="flex margin padding-top text-content solid-top">
            <view class="flex-sub text-color text-bold"><icon class="icon-tianjia text-orange"></icon>限5人报名参加</view>
            <view class="text-right hover-color text-bold">进入活动 <icon class="icon-jinru"></icon></view>
          </view>
        </view>
        <view class="mealCard" @click="NavTo('/pages/public/activity_detail')"><img src="https://js.ibaotu.com/act/21/01/04/5ff2737019170.jpg"
            alt="">
          <view class="mealTitle padding-top padding-right padding-bottom-xs padding-left text-df">
            <view class="title">甬士健身 梦想合伙人计划</view>
          </view>
          <view class="padding-right padding-bottom-xs padding-left text-content text-color">每天11点开抢</view>
          <view class="padding-right padding-left text-content">
            <view class="text-xs text-color">
              <icon class="icon-dian text-green"></icon>2021年01月08日-2021年01月20日
            </view>
            <view class="text-xs text-color">
              <icon class="icon-dian text-orange"></icon>宁波市海曙区集士港镇集仕芯谷B-401
            </view>
          </view>
          <view class="flex margin padding-top text-content solid-top">
            <view class="flex-sub text-color text-bold"><icon class="icon-tianjia text-orange"></icon>限5人报名参加</view>
            <view class="text-right hover-color text-bold">进入活动 <icon class="icon-jinru"></icon></view>
          </view>
        </view>

        <view class="van-list__finished-text padding-bottom">————————· 我是有底线的 · ————————</view>
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
      this.loadData();
    },
    methods: {
      loadData() {
        var _this = this;
        uni.showLoading({
          title: '加载中'
        });
        _this.post({
          url: '/index/getActivitys',
          data: {
            page: _this.page
          },
          success: function(res) {
            uni.hideLoading();
            if (res.data.err == 0) {
              _this.activitys = res.data.data.activitys;
            }
          }
        });
      },
      goDetail(item) {
        this.NavTo('/pages/public/activity_detail?id=' + item.id);
      }
    }
  }
</script>

<style>
  [class*=van-]:focus {
    outline: 0;
  }

  .van-list__finished-text {
    color: var(--tetx-color);
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


  img {
    display: block;
    width: 100%;
    font-size: 0;
  }

  #app {
    width: 100%;
    height: 100%;
  }

  .mealList {
    padding: 15px;
    margin: .26667rem auto;
    box-sizing: border-box;
  }

  .mealList .mealCard {
    margin-bottom: .4rem;
    border-radius: .13333rem;
    overflow: hidden;
    color: var(--text-active-color);
    background: var(--Highlight-background-color);
    border: 1px solid var(--border-color);
  }

  .mealList .mealCard .mealTitle .title{
    width: auto;
    color: var(--text-color);
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    font-weight: 700;
  }

  .mealList .mealCard .mealTitle .right {
    font-size: .29333rem;
    text-align: right;
  }
</style>
