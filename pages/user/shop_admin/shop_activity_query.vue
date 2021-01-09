<template>
  <view>
    <view id="app">
      <view class="my-menu-list">

        <view class="item" @click="NavTo('/pages/user/partner/balance')">
          <view class="item-left">
            <view class="icon balance"></view>
            <view class="text">优惠券列表</view>
          </view>
          <view class="right-arrow"></view>
        </view>

        <view class="item" @click="NavTo('/pages/user/shop_admin/shop_coupon_add')">
          <view class="item-left">
            <view class="icon balance"></view>
            <view class="text">新建优惠券</view>
          </view>
          <view class="right-arrow"></view>
        </view>

        <view class="item" @click="NavTo('/pages/user/shop_admin/withdrawal_record')">
          <view class="item-left">
            <view class="icon withdrawalRecord"></view>
            <view class="text">活动列表</view>
          </view>
          <view class="right-arrow"></view>
        </view>

        <view class="item" @click="NavTo('/pages/user/shop_admin/shop_activity_add')">
          <view class="item-left">
            <view class="icon withdrawalRecord"></view>
            <view class="text">新建活动</view>
          </view>
          <view class="right-arrow"></view>
        </view>


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
  * {
    margin: 0;
    padding: 0;
  }

  * {
    touch-action: pan-y;
  }

  #app {
    width: 100%;
    height: 100%;
  }

  .icon {
    position: relative;
    margin-right: .69333rem;
  }

  .my-menu-list {
    margin: .26667rem auto 0;
    width: 9.41333rem;
    border-radius: .05333rem;
    background-color: var(--Highlight-background-color);
    padding-top: .26667rem;
    box-sizing: border-box;
  }

  .my-menu-list .item {
    -webkit-box-pack: justify;
    -webkit-justify-content: space-between;
    justify-content: space-between;
  }

  .my-menu-list .item .item-left,
  .my-menu-list .item {
    display: -webkit-box;
    display: -webkit-flex;
    display: flex;
    -webkit-box-align: center;
    -webkit-align-items: center;
    align-items: center;
  }

  .my-menu-list .item .item-left {
    padding-left: .4rem;
    height: 1.6rem;
  }

  .my-menu-list .item .item-left .balance {
    background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAAAXNSR0IArs4c6QAAAERlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAA6ABAAMAAAABAAEAAKACAAQAAAABAAAAQKADAAQAAAABAAAAQAAAAABGUUKwAAALDElEQVR4AeVbe5RWVRX/nTszIO8BhmEQgklzJgS0kkcrBAbS1tIkk0LTcgXoqvDBShBn5R811B9GPCSjXFYS9MCWtSgp0oQkdYGKRgsdJKhgQNBxHo4wgMDMfLf9u3cO99z7ffd+370zsxrW7LXud889Z5/H3mefffbe53wKXQz2t0qGoTU1HanUONgol+7KAFUEhQGALQ9BNUtZs3w3yMcBKdsPy9qLfOsF9VBtvYPSRT+qK9q1lxRdBWXdhpR9rRA1XvpI2o8tVathqa2wUxvVqoZ/dPZ4kw4sbRz2A+UD0Nb0NSC1QGbz8jSEzshQeBOw1iFv8E/VD/aLxHQcOswAu6q0ECdPf1NmaJEQPrjjQ8qhBYUmkbBH0L/vGlVV834ONUJREjPAtm2FpcXzkMJyEfNhoT10aYGqh4VKrKhbr5SS5RIfEjHArrx4NFpaNgrhU+N32RU11A4UFNymlr99JG7rsRlgLy2eKsptE2y7OG5nXYqvVJ0oyzlqRd2OOP1YcZDtxcMWyHb2XLcjnkRwQmRszhhjEJWTBNhPzs3DK8+vEEV3X4y2/3+oynoYU2YsVTf/ri3bILIywCV+u4g8PpetsW5VrrAZU2bOycaE7EvAmfkLjHjOBCeMY88CkRLgrif78SxtdPNidYdaXb8ubJChDHC1PRUeeoVVTpSvpMt+RcDA4WLU5QEn3gVOirmfyrpcE3UnRvg58Stmhe0OGRng7POtLa92irbPE/5dNh0Yfx1QXgEMuhjIy/cTk0oJE+qA/+4Eqp8G9m0Dzp7043Tki1tkfsGkTHZCGgMcC29J8YsdNnL6DQGuWQxM+TLQu3+84beeA17/E/DM94HGmnh1Q7HFWFpVNy1oMaYz4P5h88XQCV0zoe3rgvyLgIqFwMx7gYvavV1dFvfd1gLsXA9sXQmcei9u7XR8Sy1QK+t/YRb4GOA4NidOHZDZT2bbDxoBLPg1MOoKsw8vzfVe86qs+1rguDypVlkSJaIP5GGdoks8XDP1/tvAutuBY6+buQnS4jsM7FdmOlD+xUivLinxYyYC8zcAAwIWMtfyTsmnSB/J4s4Pl3jJhOuBq+/0t1MoeuMeqf9bkao9mxMQrqvIxDo0okrnnJcA159vPJzIpSXxC/8AFIj4a2iT2X35V8CzshVTy8eBXn2BGXfJMrrbrz9scfg2Sv7u38dpzY9LVzpv6BgdT/AMIQYzkvjzFHvOvEk81+tjXwQ2PRCfeA733Gl33a+RgFLDQY8AbqG3rAFGf8LLi5sijU7gxq3oMYCRnLhAhcc1b4p93X+ANZ+RLS3CKSudBCzb5z5fj5jNTG3l93YZTjsiMXi0OgxwYnhJwljU9qbC48z//FbgvcPRQ8srAPoXuU+fwmjcD44Dj38FeFd0swYqzdnL9Ff8t9Dq0Cw1XQlgADMucJ/nVqeBa36DCFFjjc5Jf5dOFhF+RJ4femXDLwNuXQtc+ikvL5iiIiUTThvRr4/PAUaG7DbB+pm+22l2GeBEbzNhReRdu8S/z1PhRYn9jd8D7t0CTBYJGVrqNUyFN/EW4K6ngOse9PKDqcZDYhg95OVSH9zwbe87bqqdZsuJ27uh69yboHk72RAazhC1fRjMkKUy/RtuKUX6zWc9zA9OAGea3e9r7pNt8AavLJh66Zd+pVg2I9x2CNZN+7bHk3bLObSIG7enbW+at9zno7a6yWIOE2jZrZ0N/P3H7jd/G2RmH5vrOUPTxAYIAxpO22QXMIE+RjJQpN1yTmziNjAh0CmNnDDo3Q8YXuaW1v4LqBXtHwQaSIdecXOpJ0zmBnGr/yKMFEZoSM4AYXpqXL7s/TyuigdlFR4+zdsoC69VZl1D4UjRGwP1l//96E0ih65Kckxkf6n3xSV06GXgI1e7eWNkS+0lTD53ysPJNSW0s8f26cmxFpUPXVoNtO2joO0ccPAlF4M7xz1/Bj48Jb2GnXJ9A4p5NtDSQjxLSKA/kQzKpLYcVMYBBjNMf56OTTbYLNqa1h1hxNhobe9iRf8ef8dfTrsgEagiyz2ljVE7yG16ddng6B5X+R17Ix1z5Hjgzo3AFaIcKV25AJedCcExmWVRaTmhFgnQR9RRmEYZw1gm5CKyxKcru3qWPJ8GXnvSa4HtjRWb/6vrXIeq31CvLCwVDJ9xW04ENhkQE4IzHpf7ZMSu33idtpyRORAvj3DpVGDeeicZ+RP0A5rrI9GjCqkD2q2QKDSjzAlgisLSkHj9tTdQu1/sgC+ImdvkZlzyyWizmFjBPqNskPZuMr9UsyXbYDwGUPwYwNRgOkM6z3wzVrD8qPvcZJiyJs6/X5TYgXiVGkZdqVOZ32Y5pafprcx42XKFduqAhmx4aeWM3mpgGEsbOjrPfB+rFiGTdU43NtP2p3HPiEmsIbjGdT7fBX0kuiwmsIZ39nYgXmg3UAcc0G3l/K5+xo864bP+b/OrVdb4kd1uzsgJEiWW2F4QyECGwTS89U+dSn+Xz3SZoEv2P69TSd4HuA3KIowJ+7YCDF1r4ODp1YXBHx/0zNebVwNfWuthlpQDS4QIrdgOvOAGTj0Mf2rWIv/33qf933G+hHbLuY0VpxJx6f2Z9j8jQozhhQHtgE2VnjE05EMeJkNpNKx4OPKG2Pkb5ntlwRRthTFXebmHDR/Cy809JTfRlOMOn22lZaFyrymYQ0uBStEFjO4QyBTG8BjGCoPBo4CPfd7d93UAhLb9NpGK3ZvccHlYXUaOFv8NGDLaw1g/T5i2xfuOl7LRO3+45d7Dk6tocaGxxj200PXowd0h+3ufQTon/d10FNgu4v/X5V5ZQ424xz+JJp7GEg0lk/hDu+QYTSQmMahq0k4lKA6F3MNLAjyx4aGFBu4I8zZEu7MaN9c3iZ/7sJwvTvNqnBXP74m7PQPKK8k91U6zI/btQdHXcq9tYDIux0MLUwkygMkYHsNYmcCSNa8lhaY0l0EmoNhz5k3iicczw62rMtXIPU9hIi9enl/3woS9YhRdnnsLBuaVNwK3/8zvzDCAyRgew1i5+gtGk45zNLvKL/a6/KSYLowfMMCSBOTCpRA/jlXdJeA0Ijcwk8Kep9wTm9azXgt9ZfbmyFqv3AFMkkConnEPIz1FI2f89cAisTOCa97EZkidJ1ElY83cGGmPVk8CnKuuCY/GdNc8seEpUdBWZznDWIzkMJhBf54uLfPoTBGfJnV5hd/I0e1yzW//kWsskXgNSSQhcDR2ngFs076/uEr24+/o9hO9adDw0IJx+1z9+6iODgrTeCjKXYczvlC2y44wwbKWqZV1VbpLPwN477cjx+O6Vb6pHBm3Z+g6CdDI4ZZZLfu8dpfZToeYkH487mMA27c7ekGCjZjArZGRWz4MYDKGlwlIJB0bmsI0bmpknw+DMCasrACaZWmFQbYLEqzXaVdkMg2C0dvCEXKYKsuEa5+RHK5jPhRxHRPIVDeYF2TCc6Ijtnw3iGV853hFhjU69ZKUMYROT5Z81N0Ndj0RTXycS1J6kF12TU530FlvSlOU2Ge5JheyIEWB89a1rRZ21ji7rJ0o4tmp0BB2R5DFoQxgoXPDkhePL1SQsUfdEiVZkQxw6JZb1+Iob77geOBclpaxZ4GsDHBuW8utazm3u3Akwbkun/2mOHmTZgdEMcy5PK3sR8Vpkv2rGwIVHtd8xOXo4KhjMYCVe/RfZsgAR6PKxWNJiZvXXUDGwsvQMf8vxNHHlgBNco/+25xmAt899o+TJhMcRvTUv84GGeEwoyf+eToTIxxmdPO/z/8P1e7Hz7DrQnoAAAAASUVORK5CYII=) no-repeat;
  }

  .my-menu-list .item .item-left .withdrawalRecord {
    background: url(data:image/png;base64,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) no-repeat;
  }

  .my-menu-list .item .item-left .icon {
    width: .64rem;
    height: .64rem;
    background-size: 100% 100%;
  }

  .my-menu-list .item .item-left .text {
    margin-left: .32rem;
    color: #343434;
    font-size: .37333rem;
    text-align: left;
    font-family: PingFangSC-Medium;
  }

  .my-menu-list .item .right-arrow {
    margin-right: .4rem;
    height: .53333rem;
    width: .32rem;
    background: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAoCAYAAADkDTpVAAAAuklEQVRYR+2VSwrDMAxEpWum3QWdauiu7TUdXFroIo5+CAJx1so8a9BITMUfF+vTBKgOT4subhGLyNI9APAmoqb6sVMwnCIRuTHzs//TWnsAkAjEBMhAjnLQLQIzr7/OI51oQUtDNEB/fApiAaQgVkAY4gGEIF7ACHIH8NoL4ukA7onydOAW//hpXGAhcSsgLG4BpMQ1QFr8EPB/D0rWdfnB+W7RupNpHF+1zJoDVWhUMAGqddOiC1i0AbdVqimYIJX+AAAAAElFTkSuQmCC);
    background-size: 100% 100%;
  }
</style>
