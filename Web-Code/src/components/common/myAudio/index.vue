<template>
  <div>
    <audio-player
      ref="audioPlayer"
      :audio-list="audioData"
      :show-prev-button="false"
      :show-next-button="false"
      theme-color="#409eff"
    />
  </div>
</template>

<script>
import AudioPlayer from '@liripeng/vue-audio-player'
import '@liripeng/vue-audio-player/lib/vue-audio-player.css'
export default {
  components: {
    AudioPlayer
  },
  props:{
    audioData:{
      type:Array,
      default:()=>{
        return []
      }
    }
  },
  data() {
    return {
      arr:[]
    }
  },
  mounted(){
    this.arr = this.audioData
    this.$refs.audioPlayer.handleClickProgressWrap = this.handleClickProgressWrap
    this.$refs.audioPlayer.handleProgressPanstart = this.handleProgressPanstart
    this.$refs.audioPlayer.handleProgressPanend = this.handleProgressPanend
    this.$refs.audioPlayer.handleProgressPanmove = this.handleProgressPanmove
  },
  watch:{
    audioData(newD,oldD){
      this.arr = newD
    }
  },
  methods: {
    //进度条拖动
    handleClickProgressWrap(){
      console.log('拖动了')
    },
    handleProgressPanstart(){},
    handleProgressPanend(){},
    handleProgressPanmove(){},

  }

}
</script>

<style>

</style>