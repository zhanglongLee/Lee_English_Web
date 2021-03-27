<template>
  <div class="audio-wrap">
    <audio
      :autoplay="autoplay"
      ref="audioPlayer"
      preload="auto"
      :src="audioData"
    >
      你的浏览器不支持audio标签
    </audio>
    <div class="audio-btn">
      <!-- 播放 -->
      <i class="el-icon-video-play" @click="playAudio" v-show="!isPlay"></i>
      <!-- 暂停 -->
      <i class="el-icon-video-pause" @click="pauseAudio" v-show="isPlay"></i>
    </div>
    <!-- 时间进度／总时长 -->
    <div class="audio-time">{{ audioCurrentTime }}／{{ audioAllTime }}</div>
    <!-- 进度条 -->
    <div class="audio-slider">
      <el-slider
        v-model="audioPercentage"
        :show-tooltip="false"
        @change="handleChange"
      ></el-slider>
    </div>
    <!-- 设置倍速 -->
    <el-dropdown size="small" @command="changeSpeed">
      <div class="audio-speed">倍速：{{ speed }}X</div>
      <el-dropdown-menu slot="dropdown">
        <el-dropdown-item
          v-for="(item, index) in multipleArray"
          :key="index"
          :command="item"
        >
          {{ item }}X
        </el-dropdown-item>
      </el-dropdown-menu>
    </el-dropdown>
  </div>
</template>

<script>
export default {
  data() {
    return {
      autoplay:false,
      audioData:require('@/assets/audio/cet420201014_0448299emE.mp3'),
      audioPercentage: 0, // 音频进度百分比
      audioCurrentTime: "00:00", // 音频当前播放时间
      audioAllTime: "00:00", // 音频总播放时间
      audioAllDuration: 0, // 音频总播放秒数
      isPlay: false, // 是否正在播放
      multipleArray: [0.75, 1, 1.5, 2], // 倍速设置
      audioInterval: null, // 定时器
      speed: 1
    };
  },
  methods: {
    /** 设置定时检测 */
    setAudioInterval() {
      this.audioInterval = setInterval(() => {
        this.getAudioTime();
        var audioPlayer = this.$refs.audioPlayer;
        if (audioPlayer.ended) {
          // 播放结束后是否重置数据
          // clearInterval(this.audioInterval);
          // this.audioPercentage = 0;
          // audioPlayer.currentTime = 0;
          // this.audioCurrentTime = '00:00';
          // this.isPlay = false;
        }
        audioPlayer.paused ? (this.isPlay = false) : (this.isPlay = true);
      }, 500);
    },
    /** 播放 */
    playAudio() {
      // 重设定时器
      clearInterval(this.audioInterval);
      this.getAudioTime();
      this.setAudioInterval();
      var audioPlayer = this.$refs.audioPlayer;
      audioPlayer.play();
      this.isPlay = true;
    },
    /** 暂停播放 */
    pauseAudio() {
      clearInterval(this.audioInterval);
      var audioPlayer = this.$refs.audioPlayer;
      audioPlayer.pause();
      this.isPlay = false;
    },
    /** 获取播放时间 */
    getAudioTime() {
      var audioPlayer = this.$refs.audioPlayer;
      this.audioAllTime = this.formatTime(audioPlayer.duration);
      this.audioAllDuration = audioPlayer.duration;
      this.audioCurrentTime = this.formatTime(audioPlayer.currentTime);
      //计算当前进度百分比
      this.audioPercentage = (
        (audioPlayer.currentTime * 100) /
        audioPlayer.duration
      ).toFixed(3);
      this.audioPercentage = Number(this.audioPercentage);
    },
    /** 滑动进度条 */
    handleChange(value) {
      // 设置播放时间
      var audioPlayer = this.$refs.audioPlayer;
      this.audioCurrentTime = this.formatTime(
        (this.audioAllDuration * Number(value)) / 100
      );
      const currentTime = Number((this.audioAllDuration * value) / 100);
      audioPlayer.currentTime = parseInt(currentTime);
    },
    /** 设置倍速播放 */
    changeSpeed(command) {
      var audioPlayer = this.$refs.audioPlayer;
      audioPlayer.playbackRate = command;
      this.speed = command;
    },
    /** 时间格式话 */
    formatTime(second) {
      const secondType = typeof second;
      if (secondType === "number" || secondType === "string") {
        second = parseInt(second);
        const hours = Math.floor(second / 3600);
        second = second - hours * 3600;
        second = second;
        const mimute = Math.floor(second / 60);
        second = second - mimute * 60;
        return (
          ("0" + hours).slice(-2) +
          ":" +
          ("0" + mimute).slice(-2) +
          ":" +
          ("0" + second).slice(-2)
        );
      } else {
        return "00:00";
      }
    }
  },
  mounted() {
    this.setAudioInterval();
  }
};
</script>

<style scoped>
.audio-wrap{
  display: flex;
  align-items: center;
}
.call-record-audio {
  margin-top: 10px;
}
.audio-time,
.audio-speed {
  font-size: 14px;
  color: #333;
  margin-left: 10px;
  line-height: 38px;
}
.audio-speed {
  cursor: pointer;
}
.audio-slider {
  width: 300px;
  margin: 0 0 0 20px;
}
.audio-btn > i {
  font-size: 24px;
  color: #066eb7;
  vertical-align: middle;
  cursor: pointer;
}
</style>