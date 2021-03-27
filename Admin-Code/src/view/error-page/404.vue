<template>
  <div class="error-page">
    <div class="error">
      <div class="where-is-panfish">
        <img class="elem bg" src="../../assets/image/404/bg.png" />
        <img class="elem panfish" src="../../assets/image/404/panfish.png" />
        <img class="elem sea" src="../../assets/image/404/sea.png" />
        <img class="elem spray" src="../../assets/image/404/spray.png" />
      </div>
    </div>
  </div>
</template>

<script>
export default {
  methods: {
    toHome() {
      this.$router.push({ path: '/' })
    }
  }

}
</script>

<style lang="scss" scoped>
.error-page {
  width: 100%;
  background: #F7F8FB;
  color: #47494E;
  text-align: center;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  font-family: sans-serif;
  font-weight: 100 !important;
  -ms-text-size-adjust: 100%;
  -webkit-text-size-adjust: 100%;
  -webkit-font-smoothing: antialiased;

  .error {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    width: 960px;
  }

  .title {
    font-size: 1.5rem;
    margin-top: 15px;
    color: #47494E;
    margin-bottom: 8px;
  }
}

.toHome{
  font-size: 16px;
}

.where-is-panfish{
  position: relative;
  width: 624px;
  max-width: 70%;
  padding-top: 48%;

  .elem{
    position: absolute;
    top: 35%;
    left: 50%;
  }

  .bg{
    width: 77.724%;
    transform: translate(-50%,-50%);
  }

  .panfish{
    width: 20.994%;
    transform: translate(-55%,32%);
    animation: panfish 2s ease-in-out infinite alternate;
  }

  .sea{
    width: 99.199%;
    transform: translate(-50%,75.3%);
    opacity: .7;
  }

  .spray{
    width: 40.545%;
    transform: translate(-55%,162%);
    opacity: .4;
  }
}

@keyframes panfish {
  0% {
    transform: translate(-55%,30%);
  }
  100% {
    transform: translate(-55%,36%);
  }
}
</style>
