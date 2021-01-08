<template>
	<view>
		<view style="width: 100%;padding: 10px 0;background: #FFF;color: #CCC;">
			<view class="center go-home">
				<view style="padding: 5px 10px;display: inline-block;" @click="toggleUserHome('/pages/user/home')"> 普通用户 </view> |
				<view style="padding: 5px 10px;display: inline-block;" @click="toggleUserHome('/pages/user/partner/partner_home')"> 合伙人账户 </view>  |
				<view style="padding: 5px 10px;display: inline-block;" @click="toggleUserHome('/pages/user/shop_admin/shop_home')"> 商户管理 </view>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				
			};
		},
		
		methods:{
			toggleUserHome(url) {
				
				var user = this.getLocalUser();
				if(!user.remember_token || user.remember_token==undefined ){
					uni.reLaunch({
					     url:'/pages/login/login',
					});
					return
				}
				
				var content;
				switch(url){
					case '/pages/user/partner/partner_home':{
						content="切换到合伙人用户中心吗?"
						break
					}
					case '/pages/user/shop_admin/shop_home':{
						content="切换到店铺管理中心吗?"
						break
					}
					default :{
						content="切换到用户中心吗?"
						break
					}
				}
				
				uni.showModal({ //标题
					title: "提醒",
					content: content,
					success: (res) => {
						if(res.confirm){
							uni.navigateTo({
								url:url,
								success: () => {
									uni.setStorageSync('USER_HOME_URL',url);
									console.log('跳转成功');
								}
							})
						}
					}
				})
			},
			
		}
	}
</script>

<style>

</style>
