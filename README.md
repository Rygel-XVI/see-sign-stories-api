# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


add serializers for models
try httparty gem for youtube fetch



channel
has one owner
has many videos

channel_id: string


video
has one channel
has one owner through channel


title: string
description: string
embed_id: string

ar_level_high: number
ar_level_low: number
genre: [string,string]
grade_high: number
grade_low: number
pdf: file location?


genre
has many videos

name
