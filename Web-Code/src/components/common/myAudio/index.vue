<template>
  <div>
    <audio-player
      ref="audioPlayer"
      :audio-list="audioData"
      :before-play="handleBeforePlay"
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
        return ['123']
      }
    }
  },
  data() {
    return {
      currentAudioName: '',
      
    }
  },
  mounted(){
    this.$refs.audioPlayer.handleClickProgressWrap = this.handleClickProgressWrap
    this.$refs.audioPlayer.handleProgressPanstart = this.handleProgressPanstart
    this.$refs.audioPlayer.handleProgressPanend = this.handleProgressPanend
    this.$refs.audioPlayer.handleProgressPanmove = this.handleProgressPanmove
  },
  methods: {
    // 播放前做的事
    handleBeforePlay(next) {
      // // 这里可以做一些事情...
      // this.currentAudioName = this.audioData[this.$refs.audioPlayer.currentPlayIndex].name

      // next() // 开始播放
    },
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