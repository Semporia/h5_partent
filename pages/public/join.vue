<template>
	<view>
		<view id="app">
			<view id="merchantJoin">
				<view class="renderWrap">
					<p><img src="http://xym-dev.oss-cn-hangzhou.aliyuncs.com/xcs/20201125/52bd4331a359a4814f6c4e65e4268954.jpeg" alt=""
						 width="750" height="1624"></p>
				</view>
				<view class="btn">
					<view class="price ft12">
						<view class="verticalcenter"><span class="ft18">9900.00</span> 元
							<p>服务费</p>
						</view>
					</view>
					<view class="open ft18">立即开通</view>
				</view><img src="data:image/png;base64,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"
				 alt="" class="shareImg1">
				<!-- <view class="van-overlay" style="z-index: 2008;"></view>
				<view class="van-popup van-popup--center" style="z-index: 2009;"><img src="https://apis.czg365.com/poster/p_1608194027_207.png"
					 alt="" class="shareImg"></view> -->
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
	[class*=van-]:focus {
		outline: 0;
	}

	.van-overlay {
		position: fixed;
		top: 0;
		left: 0;
		z-index: 1;
		width: 100%;
		height: 100%;
		background-color: rgba(0, 0, 0, .7);
	}

	.van-popup {
		position: fixed;
		max-height: 100%;
		overflow-y: auto;
		background-color: #fff;
		-webkit-transition: -webkit-transform .3s;
		transition: -webkit-transform .3s;
		transition: transform .3s;
		transition: transform .3s, -webkit-transform .3s;
		-webkit-overflow-scrolling: touch;
	}

	.van-popup--center {
		top: 50%;
		left: 50%;
		-webkit-transform: translate3d(-50%, -50%, 0);
		transform: translate3d(-50%, -50%, 0);
	}

	[class*=van-]:focus {
		outline: none;
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

	.ft12 {
		font-size: .32rem;
	}

	.ft18 {
		font-size: .48rem;
	}

	.van-overlay {
		background: rgba(51, 51, 51, .6);
	}

	.verticalcenter {
		position: relative;
		top: 50%;
		-webkit-transform: translateY(-50%);
		transform: translateY(-50%);
	}

	#app {
		width: 100%;
		height: 100%;
	}

	/*! CSS Used from: https://www.czg365.com/static/css/chunk-7e0569c4.7560418c.css */
	#merchantJoin {
		width: 100%;
		height: 100%;
	}

	#merchantJoin .shareImg1 {
		width: 10%;
		position: fixed;
		top: 15%;
		right: 5%;
	}

	#merchantJoin .van-popup {
		width: 85%;
	}

	#merchantJoin .renderWrap img {
		width: 100%;
		height: auto;
	}

	#merchantJoin .btn {
		display: -webkit-box;
		display: -webkit-flex;
		display: flex;
		width: 100%;
		position: fixed;
		bottom: 0;
		height: 1.33333rem;
		color: #fff;
	}

	#merchantJoin .btn .price {
		padding: .18667rem .45333rem;
		width: 2.69333rem;
		line-height: .45333rem;
		background-color: #20282c;
	}

	#merchantJoin .btn .open {
		width: 2.66667rem;
		line-height: 1.33333rem;
		text-align: center;
		-webkit-box-flex: 1;
		-webkit-flex-grow: 1;
		flex-grow: 1;
		color: #000;
		background-color: #ff7214;
	}
</style>
