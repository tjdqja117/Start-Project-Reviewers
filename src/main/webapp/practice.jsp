<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Kong flix</title>
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="index.css">
</head>
<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  color: black;

  user-select: none;
}

body {
  background-color: white;
}

a {
  text-decoration: none;
}

button {
  border: none;
  padding: 0.9em 2em;
  border-radius: 5px;
  font-weight: 600;
  cursor: pointer;
}

section{
	width:70%;
	margin-left:320px;
	margin-top: 100px;
}

section .content-list {
  margin-bottom: 3rem;
  position: relative;
}
section .content-list h1 {
  margin-left: 2rem;
  margin-bottom: 1rem;
  margin-top: 0.5rem;
}
section .content-list .slider {
  display: flex;
  gap: 0.5rem;
  overflow-x: scroll;
  scroll-behavior: smooth;
}
section .content-list .slider::-webkit-scrollbar {
  display: none;
}
section .content-list .slider .item {
  min-width: 250px;
  height: 150px;
  background: lightgray;
  background: linear-gradient(312deg, 262626 0%, #333333 54%, #2a2a2a 50%);
  border-radius: 5px;
}
section .content-list .slider .item img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}


section .content-list .prev-arrow {
  transform: rotateY(180deg);
}
section .content-list .prev {
  font-size: 3rem;
  position: absolute;
  top: 50%;
  left: 10px;
  transform: translateY(-10px);
  cursor: pointer;
}
section .content-list .next {
  font-size: 3rem;
  position: absolute;
  top: 50%;
  right: 10px;
  transform: translateY(-10px);
  cursor: pointer;
}


}



</style>
<body>
    <section>
        <div class="content-list">
            <h1>한국이 만든 콘텐츠</h1>
            <div class="slider">
            </div>
            <div class="prev"><i class="fa-solid fa-angle-right prev-arrow"></i></div>
            <div class="next"><i class="fa-solid fa-angle-right"></i></div>
        </div>
        <div class="content-list">
            <h1>지금 뜨는 콘텐츠</h1>
            <div class="slider">
            </div>
            <div class="prev"><i class="fa-solid fa-angle-right prev-arrow"></i></div>
            <div class="next"><i class="fa-solid fa-angle-right"></i></div>
        </div>
        <div class="content-list">
            <h1>오늘 한국의 TOP 10 콘텐츠</h1>
            <div class="slider">
            </div>
            <div class="prev"><i class="fa-solid fa-angle-right prev-arrow"></i></div>
            <div class="next"><i class="fa-solid fa-angle-right"></i></div>
        </div>
    </section>
    <script>
        const next = document.querySelectorAll('.next');
        const prev = document.querySelectorAll('.prev');
        const slider = document.querySelectorAll('.slider')

        for(let i =0;i<slider.length;i++){
            getMovies(slider[i],i+1);
            makeSlider(slider[i],prev[i],next[i]);
        }
        function makeSlider(element,prev,next){
            next.addEventListener('click',()=>{
                const offsetX = element.offsetWidth;
                element.scrollBy(offsetX,0)
            })
            prev.addEventListener('click',()=>{
                const offsetX = element.offsetWidth;
                element.scrollBy(-offsetX,0)
            })
        }
        function getMovies(element,page){
            fetch(`https://yts.mx/api/v2/list_movies.json?limit=20&sort_by=rating&page=${page}`)
                .then(data=>data.json())
                .then(data=>{
                    const movies = data.data.movies;
                    movies.forEach(movie=>{
                        const div = document.createElement('div');
                        div.className='item';
                        div.innerHTML = `<img src="${movie.medium_cover_image}" alt="">`;
                        element.appendChild(div);
                    })
                })
        }
    </script>

<button onClick="location.href='testMovie.do?type=movie'">메인</button>
</body>
</html>