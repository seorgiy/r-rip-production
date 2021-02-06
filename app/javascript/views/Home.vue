<template>
  <div class="home">
  	<div class="wellcum">
  		<h1>Как это было</h1>
  		<p>Здесь мы постарались собрать самые яркие истории, каким мы запомним Рокет</p>
  		<p>Неважно, сотрудник вы или клиент, помните хорошее или плохое, поделитесь! Мы должны запомнить и сохранить все впечатления о ярком событии в финтех-жизни России.</p>
  		<p>Мы помним всех  людей, которые были причастны к этому проекту и страшно ими гордимся </p>
  	</div>


  	<div class="post-container">
  		 	<div class="button-big">
  		<!-- <img width= "40px" height="40px" src = "@/assets/plus.png" style="margin: auto;display: flex; vertical-align: middle;" /> -->
  		<p style="text-align: center; vertical-align: middle;">{{butttext}}</p>
  	</div>
  			<Post v-for="post in posts" :params="post" />
  	</div>

  </div>
</template>
<style>
	.home {
		display: flex;
		flex-direction: column;
	}
	.button-big{
		display: inherit;
		flex-direction: row;
		margin: 0rem 1.3rem;
		vertical-align: middle;
		border-radius: 10px;
		padding: 0.1rem;
		text-align: center;
		font-weight: 600;
		color: white;
		letter-spacing: -0.02em;
		width: 30%;
		background: #ff5f0b;
		-webkit-box-shadow: 0px 6px 14px 0px rgba(255, 95, 11, 0.4);
-moz-box-shadow: 0px 6px 14px 0px rgba(255, 95, 11, 0.4);
box-shadow: 0px 6px 14px 0px rgba(255, 95, 11, 0.4);
-webkit-transition: all 0.3s ease-out;
-moz-transition: all 0.3s ease-out;
-ms-transition: all 0.3s ease-out;
-o-transition: all 0.3s ease-out;
transition: all 0.3s ease-out;
	}
	.button-big:hover{
	-webkit-box-shadow: 0px 10px 15px 0px rgba(255, 95, 11, 0.32);
-moz-box-shadow: 0px 10px 15px 0px rgba(255, 95, 11, 0.32);
box-shadow: 0px 10px 15px 0px rgba(255, 95, 11, 0.32);
opacity: 0.7;

	}
	.post-container{
		width: 70%;
		margin: 2.5rem auto;
	}

</style>
<script>
// @ is an alias to /src
import Post from '../components/Post.vue'
export default {
  name: 'home',
  components: {
    Post
  },
  data: function () {
    return {
      posts: [
      {text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras in sem elit. In sit amet nisi mauris. Nulla elementum aliquam risus, vel convallis augue elementum ut. Sed fringilla mi ut eros luctus, facilisis tristique odio dictum. Suspendisse feugiat dignissim orci sed bibendum. Donec ipsum mi, vulputate a tincidunt sit amet, mollis nec eros. Aliquam dignissim, lorem nec rhoncus egestas, ante arcu accumsan tortor, et sodales turpis libero vel turpis. Nullam aliquam orci nec feugiat facilisis. Vivamus augue massa, mattis ac libero mollis, aliquet sagittis augue. Nulla sagittis finibus ante, in gravida ligula consequat non. Phasellus congue tincidunt elit at tempus. Maecenas porta porttitor rutrum."},
      {text: "Duis in mi eget enim sodales dictum. Nulla et dolor tempor, mattis urna sed, vulputate turpis. Morbi malesuada tortor mi, vel eleifend mauris congue sed. In eu nisi at metus pulvinar bibendum. Duis quis enim eu est viverra semper. Proin tincidunt arcu vel ex laoreet, sed porta risus mattis. Duis in pellentesque nisl. Morbi vitae elit et massa feugiat euismod et et neque. Vestibulum nec faucibus quam. Cras scelerisque turpis sed augue sollicitudin, at dictum sapien euismod. Cras in libero lacinia, tincidunt ipsum ac, gravida ante. Nulla auctor venenatis enim, convallis consequat neque pretium sit amet."},
      {text: "Nunc id quam sem. Nam at odio viverra, consequat risus ultrices, porttitor risus. Etiam auctor sem id libero posuere, in malesuada neque convallis. Nam lobortis vulputate sapien nec pulvinar. Vivamus tincidunt convallis laoreet. Donec cursus, nisi et finibus finibus, ligula est laoreet nisi, sit amet pellentesque felis odio sollicitudin leo. Proin nibh felis, dignissim vitae lacus eget, imperdiet fermentum purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas."},
      {text: "Integer nulla ante, ultricies id aliquet ac, vulputate nec risus. Proin quis nulla cursus, sagittis tortor quis, iaculis lorem. Sed et venenatis erat. Proin tempus, justo non ultricies aliquam, erat metus egestas nisi, vel sodales sem augue eget erat. Aenean aliquet, ex sit amet semper egestas, nibh magna rhoncus enim, id placerat ipsum diam vel tortor. Ut dictum justo faucibus, suscipit tellus id, fringilla libero. Curabitur dapibus commodo libero, vel cursus ipsum elementum non. Sed bibendum porta sapien. Ut ullamcorper aliquet nibh non facilisis."},
      {text: "Sed vestibulum varius convallis. Aliquam sed luctus felis. Aliquam molestie turpis quis sagittis facilisis. Nam tellus lacus, rutrum non suscipit vel, sagittis in lacus. Ut dictum eget nulla quis varius. Duis id accumsan nunc. Phasellus non fringilla leo, sed porta lacus. Donec aliquet nulla a ligula congue sollicitudin. In fermentum dolor nisl, at accumsan enim tempor commodo. Etiam tristique lorem urna, at faucibus nisl eleifend a. Aliquam nisi massa, molestie ut nisi at, luctus aliquam dui. In eget sagittis justo."},
      {text: "Praesent at libero non nunc laoreet finibus. Curabitur vehicula commodo elit sed pretium. Nunc pulvinar, libero sed euismod sollicitudin, mi magna volutpat neque, vitae porttitor nunc ligula vel orci. Donec ac lacus fringilla, vestibulum sapien ut, ornare arcu. Fusce aliquet erat est, a posuere augue laoreet ac. Quisque tincidunt velit id quam cursus mattis. Curabitur ultricies dui vel dolor eleifend accumsan. Aenean lectus tellus, malesuada sed justo vitae, tempor tempus massa. Vestibulum vel scelerisque nisi. Maecenas ultrices hendrerit felis. Sed dignissim odio quam, vitae pharetra lorem vehicula ac."},
      {text: "Praesent ut lacinia risus, ut gravida erat. Etiam non orci sed sem sollicitudin dictum. Integer vehicula tincidunt urna a hendrerit. Nulla interdum condimentum nunc in ullamcorper. Suspendisse vehicula nibh ac tincidunt tristique. Suspendisse ac iaculis nulla. Suspendisse potenti. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec hendrerit metus vel neque congue, in dapibus neque dictum. Curabitur varius, arcu nec volutpat lacinia, est magna malesuada mi, ac ullamcorper velit lacus nec nisl. Quisque elit ex, gravida nec velit sed, rhoncus imperdiet risus. Etiam faucibus, mauris sit amet convallis congue, mauris magna fermentum ligula, vitae vehicula lacus velit nec velit. Nulla eget laoreet nibh. Cras urna lorem, pharetra et mollis vitae, hendrerit vitae tellus. Phasellus consectetur dapibus neque et vestibulum."},
      {text: "Donec euismod est magna, suscipit fringilla diam scelerisque ut. Phasellus consequat pharetra turpis. Phasellus id leo est. Cras lectus nisl, lacinia ac turpis et, dictum commodo lectus. Cras suscipit nulla mi, et pellentesque mauris tempor at. Quisque sit amet egestas nisl. Donec accumsan massa nec maximus hendrerit. Aenean ac lectus eu nisl finibus placerat non eget enim. Maecenas sodales pharetra est, id porttitor nunc dignissim id. Aenean porttitor consequat placerat. Fusce ut diam eleifend, eleifend tellus quis, placerat leo."},
      {text: "Nullam dignissim pretium nibh in tristique. Ut suscipit est a suscipit pharetra. Donec quis gravida arcu. Nam quis interdum tortor, quis pellentesque mi. Aenean pharetra libero et lectus cursus, sit amet molestie diam cursus. Pellentesque dignissim, urna sed lobortis finibus, orci mauris ultricies dolor, iaculis dignissim tortor leo eu nulla. Mauris egestas fringilla pretium. Aliquam quis scelerisque metus. Nunc porta pretium faucibus. Vivamus pellentesque arcu ornare odio venenatis consequat. Fusce diam massa, consectetur vestibulum ante id, ullamcorper mattis turpis."},
      {text: "Pellentesque in facilisis risus, varius pharetra mauris. Quisque a pharetra justo. Ut sodales, nisl non tincidunt volutpat, est lacus aliquam urna, vel bibendum tellus urna euismod lacus. Praesent at ipsum mollis, dapibus tortor nec, rutrum velit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer quis sapien vitae justo blandit efficitur. Nullam eget erat bibendum, auctor libero tincidunt, ornare nulla. Quisque interdum, massa lobortis malesuada finibus, sem risus ornare lorem, rutrum lobortis diam leo mollis velit."},
      {text: "Etiam ut mauris eget nisi ultricies rhoncus. Praesent euismod felis lacus, nec sodales tellus faucibus a. Mauris erat ligula, porta eu nibh id, volutpat pretium arcu. Mauris feugiat libero libero, ac dignissim velit volutpat vitae. Aenean ut fringilla purus. Proin a dapibus turpis, vel commodo elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent ullamcorper sit amet est at lacinia. Sed ornare tortor ac ligula elementum vestibulum nec eu nunc. Mauris interdum metus eu nulla congue pulvinar. Ut consectetur sapien ut bibendum placerat. Aenean volutpat, odio nec eleifend efficitur, nibh tortor sagittis lacus, et dictum justo neque maximus augue."},
      {text: "Praesent dignissim enim eget accumsan placerat. Aenean ex massa, dapibus vitae imperdiet vel, suscipit vel sapien. Proin varius risus nec sem blandit, a blandit diam pretium. Donec eget laoreet augue, at posuere nisi. Cras posuere libero turpis, non malesuada nisl rutrum id. Integer varius enim vitae convallis vestibulum. Sed ut tincidunt tellus, non cursus ipsum."}
      ],
      button_text: ['Поделиться воспоминаниями', 'Написать на Банки.ру', 'Подать жалобу в ЦБ', 'Составить обращение', 'Жим-жим не тужим', 'Выдай мне ещё тикет']
    }
  },
    computed: {
    // геттер вычисляемого значения
    butttext: function () {
      let rand = 0 - 0.5 + Math.random() * (this.button_text.length - 0 + 1);
      return this.button_text[Math.round(rand)]
    	}
  	}
}
</script>
