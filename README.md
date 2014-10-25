
```
	$ bundle exec sidekiq #default with 25 processes
	$ rake push #enqueue 6000 jobs per minute(1000 every 10 secs). OK with 25 processes
```

```
	$ bundle exec sidekiq -c 1000 #100 processes
	$ rake push\[4000] #24000 jobs per minute(4000 every 10 secs). OK with 25 processes
```