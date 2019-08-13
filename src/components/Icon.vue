<template>
    <div class="icons">
        <div class="icon">
            <div class="icon-img">
                <img src="" alt="">
            </div>
        </div>
    </div>
</template>
<script>
export default {
    name: 'icon'
}
</script>
<style lang="stylus" scoped>
.icons
overflow 
width 100%
height 0
padding-bottom 50%
background red
.icon
float left
position relative
overflow hidden
width 25%
height 0
padding-bottom 25%
background green
.icon-img
position absolute
top 0
bottom 0.44rem
left 0
right 0
background pink
img
display block
margin 0 auto
</style>