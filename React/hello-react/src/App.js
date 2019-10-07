import React from 'react';
import PropTypes from 'prop-types';
import axios from 'axios';
import { async } from 'q';
import Movie from './Movie';


class App extends React.Component{
  
  state ={
    isLoading: true,
    movies: []
  }
  // 비동기임을 알림. 
  getMovies = async () =>{
    // await : 데이터를 가져오기까지 시간이 걸리기 때문에 기다리라는 뜻.
    const{data:{data:{movies}}} = await axios.get("https://yts-proxy.now.sh/list_movies.json");
    //this.setState({movies: movies})
    this.setState({movies, isLoading: false});
  }
  componentDidMount(){
    this.getMovies();
  }
  render(){
    const {isLoading, movies} = this.state;
    return (
      <section class="container">
      {isLoading ? (
        <div class="loader"><span class="loader__text">Loading...</span></div>
      ) :  (
        <div class="movies">
          {movies.map(movie => {
            console.log(movies);
            return <Movie key={movie.id} id={movie.id} year={movie.year} title={movie.title} summary={movie.summary} poster={movie.medium_cover_image}/>;
          })}
        </div>
      )
    }</section>
    )
  }
}


export default App;
