<template>
	<view>
		<view class="van-overlay" style="z-index: 2136;" :class="{'hide':showOrHide=='hide'}"  @click="close">
			<view class="van-popup van-popup--center" style="z-index: 2137;" >
				<view id="qrcode" title="QByhR1YD"><canvas width="200" height="200" style="display: none;"></canvas>
				<img alt="Scan me!"
					 src="data:image/png;base64,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"
					 style="display: block;"></view>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		name: 'qrcodeshow',
		props: {
			showOrHide: {
				type: String,
				default: 'hide'
			}
		},
		data() {
			return {
				
			};
		},
		methods:{
			show(){
				
			},
			close(){
				this.showOrHide = 'hide';
			}
		}
	}
</script>

<style>
.hide{
	display: none;
}
[class*=van-]:focus{outline:0;}
.van-list__finished-text{color:#969799;font-size:.37333rem;line-height:1.33333rem;text-align:center;}
.van-list__placeholder{height:0;pointer-events:none;}
[class*=van-]:focus{outline:none;}
.van-ellipsis{overflow:hidden;white-space:nowrap;text-overflow:ellipsis;}
[class*=van-hairline]:after{position:absolute;box-sizing:border-box;content:" ";pointer-events:none;top:-50%;right:-50%;bottom:-50%;left:-50%;border:0 solid #ebedf0;-webkit-transform:scale(.5);transform:scale(.5);}
.van-hairline--top-bottom{position:relative;}
.van-hairline--top-bottom:after{border-width:.02667rem 0;}


.van-overlay{
	position: fixed;
	top: 0;
	left: 0;
	z-index: 1;
	width: 100%;
	height: 100%;
	background-color: rgba(0,0,0,.7);
}
	
.van-popup{position:fixed;max-height:100%;overflow-y:auto;background-color:#fff;-webkit-transition:-webkit-transform .3s;transition:-webkit-transform .3s;transition:transform .3s;transition:transform .3s,-webkit-transform .3s;-webkit-overflow-scrolling:touch;}
.van-popup--center{top:50%;left:50%;-webkit-transform:translate3d(-50%,-50%,0);transform:translate3d(-50%,-50%,0);}
#qrcode img{display:block;width:100%;font-size:0;}
#qrcode{padding:.26667rem;}
	
</style>
