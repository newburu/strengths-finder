module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  plugins: [
    require('daisyui')
  ],
  daisyui: {
    themes: ["dark", "cupcake"],
  },
  theme: {
    container: {
      center: true, // 中央寄せにする
      padding: '2rem', // パディングを追加する
    },
  },
}
