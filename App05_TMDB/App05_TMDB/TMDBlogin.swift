//
//  TMDBlogin.swift
//  App05_TMDB
//
//  Created by Alumno on 27/09/21.
//
// Note: add this file to .gitignore to protect credentials

import Foundation


let apikey = "dfa37c9d5d29b691f490d46ef2bad185"
let apiauth = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkZmEzN2M5ZDVkMjliNjkxZjQ5MGQ0NmVmMmJhZDE4NSIsInN1YiI6IjYxNTFkNmY0YWY5NTkwMDA0MzA3ZTU5NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.jFAo0e1BduJRsgzKpjTWa3kI7JnpoWIs_zOpZAfcTA4"
let headers = [
    "Authorization": "Bearer \(apiauth)",
    "Accept": "application/json",
    "Content-Type": "application/json" ]
let tmdbURL = "https://api.themoviedb.org/3/"
let imageURL = "https://image.tmdb.org/t/p/original" //prefix used for images
let youtubeURL = "https://youtu.be/"
