<template>
	<view>
		
		
		<!-- <view>aaaa</view> -->
		<ul class="menu-tabbar flex w-100" active-tabbar="3">
			
			<li class="menu-item flex-1 ft10 flex-center" @click="NavTo('/pages/public/activity_hot')">
				<view class="menu-inner"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAAAXNSR0IArs4c6QAAAERlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAA6ABAAMAAAABAAEAAKACAAQAAAABAAAAMKADAAQAAAABAAAAMAAAAADbN2wMAAAEdklEQVRoBe2ZS0ycVRTHGYa3SAk1hG4oj4EOYaEJixpqayIJNNWqJLIw4aHGmDQuJNh01SZEY2JqjOzayo7YBh+hMRDqQnF8IC7Ko7TDKzxsTCSKBq1JgRmG8XfjnC8XZnjMN9/HhGS+5HLOd+495/7/59x7Z7iTlJR44psBhx3TV1ZWZq+srFwidj0t6HA4vsjNzX1veHj4odXzWU6goqLiyOrq6i2APq6DhcRt2rNzc3N/6PZYdUsJlJeXu/1+/1eAOhoJGARmk5OTT8/Ozs5F6jdjSzbjFMmntLS0GvA/0qeDHwW0V8YHg0HXxsbGT4ytElus0hICLpfreYB9DZjDAgjg36SlpT2dk5PzFPoPYodEPs2DT63YYpExEyCbbwQCgR5AZAoQAN/IzMw8Mz09/e/Y2NjfhYWFtdhuSj8EsiHcV1xc3Cg2szImAiUlJe0AucbkTgHAGv+Qjdro9Xp9YvN4PKvNzc0vQeKK2CCRit5FAs6LzYw0tYkbGhqcIyMjVwH/ujapOi7fnp+f/0izhakAvojfu3oHfh2QbkMGdfte9KgJVFVVZS0vL3eTwbMyARP7aC2A6BbbTpLKvYb/x4wxKod/N8uuRa/cTjGkLyoCbrf78NraWh/OTxoBHI4HTF4P+AGx7UVC4jlIfMrYLBlPnAGWYD3H7AOx7Sb3vAcAXwT4QQIa4NEXU1JSTkULXoFiqfU5nc4a1L/Uu3og9AwHwnd8khf8b9n9754qUFZW9sT6+no/4Y5oIaczMjLqJicn72u2qNVjPD6fT334FWnOv1CNOkjOaLaI6q4VoNQ1Kit46+CH0tPTT8QKXiHiqFWJqEa9o95DTxFykMQdF8N2ckcCgH8Zx35KmyMByExvQUFBzdTUlFF66TMrScQiy+kUsb+VGMz5GFUfAMMZsUWS2xLAsY0g12lpmmMnp1D90NDQimazRFUbl1PoNME+0wKqDf4lWF7VbJtU4xjTrZzVFwD+ATaH2MlO+8LCwvmJiYmoz2qJsZtcWloKtLa29oyPj+cyVg4LleQX8vLyfuX4Ht0awwAoHYB3AX6SlhKyBTjaznHSdMqY/ZAqiXzgvc9cgvFhamrq0ZmZmT/1+cOWEMBPCniyvs5gdcbvK3gFkDkvk7hXlB56stgTYZs6EoE88YDIPyybXnnfb9nU1PSJPieEDGxiDyMgHQdFJgjEu1KJCsS7AnLW24FD/XP/Ii1A+5z2O83yxy4C6SD9mSZfi99Er7AcPQHt2gMq+wJe4XbTDinF6scuAvLxr+ONZNP7Tel2ETAFxoxTgoCZrFnpk6iAldk0EytRATNZs9InUQErs2km1oGvgF1f5tSVoHFpG8qs5XdJKq5dBNTdkS2AQ8kwRBgB/vP3cx8jAzK4FXtLXvZbdnV1bfoCyC2JfyuGMAIMuKcNegSnDu09rir3VHe3AgjbxNzFeBj0/daB8X4HfA/3p8ZPtoJnU4nEyJX9o/zmq37HUjfD+WKPh2QF/MayvgmBdyCwFg8MiTl3ysB/XxV0W3HEJIkAAAAASUVORK5CYII="
					 class="menu-icon">
					<view>热门</view>
				</view>
			</li>
			<li class="menu-item flex-1 ft10 flex-center" @click="NavTo('/pages/public/activity_list')">
				<view class="menu-inner"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAAAXNSR0IArs4c6QAAAERlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAA6ABAAMAAAABAAEAAKACAAQAAAABAAAAMKADAAQAAAABAAAAMAAAAADbN2wMAAADCElEQVRoBe2YO4xNURSGx5DR0JEgYgbxiHhLCFFMCMlkKJQKGoVI6BVqj+hEgkqpU2jophAhCgphCpG5SMT7Ee+375e7xpoz53nPY07i/Ml/99p7r73Xv/beOWef29XVoFmB/3sFJpWU/lTmPQQH4E84BE/Bj7D2mInC6/B3gPepz4W1hgQOw6B4q4/Qt7CuGUiYBJrYb9gH4T74ybU/wV4GawUJkjAT/xl70Cnsx34Prf8F9lpYKqYw+2q4EfbERFpH30to4iS0HwaxgYbX0PzeYm8KOrl6N/YK2AszP2y2MOgRtGA6AudhcOs30/bO+UmghEZhFR3PoM37AXtrwHk29ZNQu2R+t7Hj5qX7HxZh6nFng335i/ZLUMK3Q+/3lPpKmIQlODyGNu8X7J1wATwLVbc+X76ifT5MxBk8bKB24ZqrW7tKPd+tLr/FMC36cHwAbfx37B+ubu3DtPnjeZR6Im7gYROsb3uvobwAw4Lo+T6v7ZelmIPzPWixfDlEu3ZY0G5b39W/LQk/d9wAHScPbeFpaI9F+c7yDhntGfjfghJox1MPDQ9psAQULxFxCdhgvW13wWnWkKOczli9K5ZHzKGjWXgCEbFKaY7dge5SQlY4aZNAhYsdGqrZgdBlqbCx2YEKFzs0VNE70EsUfQ9HYTIdS2FhcQubCFFHYAs+hNtgELqK34W6oF0MdhZZT3OVCIt3k0Z75X/F3uGc9GHi7/e6MqddvNg3sYsxanaagO5G/oqtJAahxD+HlpxK7VZaVJaABO2BwST8fV7ij8kxAypNQLr2Qp+EX/njGYSba+UJKHBYEidMUcZyQhKQxt3wDdR382HYKSYsAQnWXzM9nSpvj4tNQAHKhL6hS0XaZ3GpIvJM3iSQZ/WKGNvsQBGrmGeOpB3I/K9wHjERY70GvdXHIOwxOoKH/cm0H/scHDdwzCzlVSReGgwtM+LKA3T6+0udbGlLhI7VFVgn4dIiTeOOvD9f9I9Cjtq6AdgHo/zoKhUS3oKXoY6y/gBu0KxAswJuBf4A9HNOEBANrp0AAAAASUVORK5CYII="
					 class="menu-icon">
					<view>活动</view>
				</view>
			</li>
			<li class="menu-item flex-1 ft10 flex-center" :class="{'active':nav=='user_order'}" @click="NavTo('/pages/user/accounts')">
				<view class="menu-inner"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAAAXNSR0IArs4c6QAAAERlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAA6ABAAMAAAABAAEAAKACAAQAAAABAAAAMKADAAQAAAABAAAAMAAAAADbN2wMAAADV0lEQVRoBe1ZTWgTQRTOf4l/YKASknhK4k2kpKCCh1CwoJ6qFG+9FOJFPHmoerAIQqGeioIHT9JbaOtFBRXJodBKqSLeTAJCfgwqCIkmmObH75V9wwSTkB3SZIs78HhvZ/a9931vZie7E4vFbGYFzAqYFRhmBaxycr/ff6rZbC5YrdbT0EflsT20m4j9HTm/QieR94Xb7X6eTqe/9ZJTEPD5fGMIsokArl4c9/ieBrAsO53Ou1/QuuWy8SAcFg0CniDZgGVmZ2fncyAQmGOM7bQ8AyXccIhustvtU5lM5lk7h373TU9P27e2tkbr9XoAoCcgU5Azch4Ud8Xr9c5sb2+X5f4WG0uoydIyMIQLPIsTkPeMR9Or8/PzYsUwLHkG6GHabfl8XvRz36B1KBQaKZfLj5B3Vsq9AGy3pGuLAEosecAIBBgLZuIxltQ17bpus9nGstnsJx7/Z0p4wCg6HA5fB5Z1DY+90Wg8kLGpELiPAH8gNGN6hHzIV1dLJBI1ONyANDTHSexMIQ6iQoCCqfxWkA/56m5Y0h+wE72UHC+zrUJgCc5VDqBDkw/5KjU8ByvsCHuSbQcbOvQd3Esy0OZyuTaqVVG345xcZQbYd6Da4XDkOSFmwM/2viGQSqWKDBr6INsqBAa6CzHQTlqFwMB3oU7gqV+FwFB2oU4k9s0u1ImAygx0ijWU/v+SgLkL9XOtqSwhQ+1CMoHfXBl8DR1hu42m96ARCH0M6RHy6fs7lCCA19UcEuy2Wq3mY9voWhAA0AyDxVvfWbaNrgUBzMBrBgv7CttG14IAgMofDBfwkT9mdPCETxDAl34K16800NS/FI1GVV41tBCDUYIApcORxU2oupb6XDKZfKjZhlUtBLTzFnFsQecxWEpP6JDJqAxaCBDIWCx2G2pNAjxbqVQ26LhP6jOMKU7mZESRSORAoVB4ihlo2Y2wO21C1iBv8Y2aGR8f/xGPx3nJySH6buMsaAqHWqta4F84ajlMdlsCnJ2OtkHiHsTJfUbQKOCbXC53nrDYuwEqFovrHo9nGQTo35qTkK6Eu8Xq1xjAV4HnaqlUKlDMngEFg8FjeBYuIcBF+J1AEC/0qJ4YuFe5Ie9P5HwHPYfqf1QOZDqaFTArYFagrxX4Cw32MBvcp15tAAAAAElFTkSuQmCC"
					 class="menu-icon">
					<view>订单</view>
				</view>
			</li>
			<li class="menu-item flex-1 ft10 flex-center" :class="{'active':nav=='user_home'}" @click="goHome">
				<view class="menu-inner"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAAAXNSR0IArs4c6QAAAERlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAA6ABAAMAAAABAAEAAKACAAQAAAABAAAAMKADAAQAAAABAAAAMAAAAADbN2wMAAAD0klEQVRoBe1Zv2sUQRSeyQVBEayiJkhQuwN/gcbfre2J5g9I1EoUEbFIZZFCjIVpRGKn6S0UVLSxsNRKQdHiOKLGRGxEUCO5G78v3rt7e7m97Nzu3S6aBx/zdmbem+/Nzcy+2TNmVVZn4P+eAZtQ+LvgpwDkgQGF9dDjyAyMXwLXgBdxHDWzJelJoAi4DmMR/i8CicggvNwFykAr4hW0/4gJ7Z9BDAFtyxpYTgC/AO2Y+iwwBQwDHGQL0AvElX44eATIePfaddgHw+fKER3yF5gGDgBJ7SW4WibcUxIA94S37IZFCRAnLB8DrO+W6F/da0yS/A4I+QXop7w8JNO5rQC4bEqAkJ+HfhhIQ7wD4IbVa34Oz9vSYF4d0zsAnjYy81w2ac28zJlXADzntcGoeEmx1HxWpMGXlMw+z+AsSOQAdoKtvGFZMl3IgkQOgLmNzD5/iaxIaACNr/vjivFNpddUd7nvgnFuHC/fDyiH7Y2v76XRXdpUMLZyG/W/TW/vqL0+90zaOlX2KMdcLnJUMrdhGrtcKkhtndkAkjsQxNlAB1u+gvrNqBs0i+WxQFuHHnQAzOdFHkDhUmoibm2t0rp1NZ2KM/Vnq/RAp2QfdAB55fqp0jOt6gAGFNMZpWdaDQvgc6ZZK3LNAuBNal71aVDtz1qFs7xx1cUu3cD+Pjul13skrukAojnvMWO4vnzDCfTa5MytgJHLjRtrmfjNmJy7Gmhr/4GJJUFhah8q79AiLzG9H0INutTA3Ex4kWNA9C/As1+kX5QMlJqL5rhELSwARp0V0VxaBvBWMT6m9LRVzeVNKzJMJWStfYRuW3XuUhs58EgXXsyWW0oRrdI51keklqNEbzyo+JDbMtF7gI33VY9zSk9LPa8G1txUdVDlMtIXmhV/sqB5ok974K0CcEWQU2QuvMjIMnoIPS15goGFBzlFFh5b+gY0EtkyuY5n4ErIM3UhJy+ZQG9xwGAOeVnH63wU5guAjM//BryFuUfjh62t3l78DbbD5Asg5MmBXNqSxk+LTNI6+UscgX9mwUK+BJ0cYknjx10up5FYHpsbn0a1XjbMOnkiJiIMogTIzLDk6RT5WEPfMKFvfqrXvkt4Zn2ishHe9J7ggDyb7wBDgE/awb77gWlA3jkSAMeIvWzgo6lwM/F00kesDMzciZebE8BegPeJXBXU9wEngSngEyB2UtInfbe9YWEbWXgm88XSOHtCRkq2R+lDX97nPGxiC/fAJFAEhHTUkja0jb2PfNYuxgsVnhgFIA9wyQigLv2DOVsteefgR7NXwKr8EzPwByXzYvZMZGhIAAAAAElFTkSuQmCC"
					 class="menu-icon">
					<view>我的</view>
				</view>
			</li>
		</ul>
	</view>
</template>

<script>
	export default {
		name: 'footnav',
		data() {
			return {
				
			};
		},
		props: {
			nav: {
				type: String,
				default: ''
			}
		},
		methods:{
			goHome(){
				var user = this.getLocalUser();
				
				if(!user.remember_token || user.remember_token == undefined){
					uni.navigateTo({
						url:'/pages/login/login',
					})
					
					return
				}
				
				var jump_url='/pages/user/home'
				try {
				    const user_home = uni.getStorageSync('USER_HOME_URL');
				    if (user_home) {
				        jump_url=user_home;
				    }
				} catch (e) {
				  
				}
				this.NavTo(jump_url);
			}
		}
	}
</script>

<style>

ul{margin:0;padding:0;list-style:none;}
*{margin:0;padding:0;}
*{touch-action:pan-y;}
img{display:block;width:100%;font-size:0;}
.ft10{font-size:.26667rem;}
.flex{display:-webkit-box;display:-webkit-flex;display:flex;}
.flex-1{-webkit-box-flex:1;-webkit-flex:1;flex:1;}
.flex-1{display:-webkit-box;display:-webkit-flex;display:flex;}
.flex-center{-webkit-box-pack:center;-webkit-justify-content:center;justify-content:center;}
.flex-center{display:-webkit-box;display:-webkit-flex;display:flex;-webkit-box-align:center;-webkit-align-items:center;align-items:center;}
.w-100{width:100%;}
.menu-tabbar{position:fixed;bottom:0;height:1.33333rem;color:#484848;background:#fff;}
.menu-tabbar .menu-inner{height:1.06667rem;line-height:.42667rem;}
.menu-tabbar .active .menu-inner{color:#2599ff;}
.menu-tabbar .menu-icon{width:.58667rem;height:.58667rem;margin:0 auto .10667rem;}
.menu-tabbar{position:fixed;bottom:0;height:1.33333rem;color:#484848;background:#fff;}
.menu-tabbar .menu-inner{height:1.06667rem;line-height:.42667rem;}
.menu-tabbar .active .menu-inner{color:#2599ff;}
.menu-tabbar .menu-icon{width:.58667rem;height:.58667rem;margin:0 auto .10667rem;}
.menu-tabbar{position:fixed;bottom:0;height:1.33333rem;color:#484848;background:#fff;}
.menu-tabbar .menu-inner{height:1.06667rem;line-height:.42667rem;}
.menu-tabbar .active .menu-inner{color:#2599ff;}
.menu-tabbar .menu-icon{width:.58667rem;height:.58667rem;margin:0 auto .10667rem;}
.menu-tabbar{position:fixed;bottom:0;height:1.33333rem;color:#484848;background:#fff;}
.menu-tabbar .menu-inner{height:1.06667rem;line-height:.42667rem;}
.menu-tabbar .active .menu-inner{color:#2599ff;}
.menu-tabbar .menu-icon{width:.58667rem;height:.58667rem;margin:0 auto .10667rem;}

.menu-tabbar{position:fixed;bottom:0;height:1.33333rem;color:#484848;background:#fff;}
.menu-tabbar .menu-inner{height:1.06667rem;line-height:.42667rem;}
.menu-tabbar .active .menu-inner{color:#2599ff;}
.menu-tabbar .menu-icon{width:.58667rem;height:.58667rem;margin:0 auto .10667rem;}
</style>
