task :push, :count do |t,args|  
  args.with_defaults(:count => 1000)
  count = args[:count].to_i  
  safe_total = Profile.count - 50000
  total = 0
  start_at = Time.now
  puts "[#{start_at}] - Pushing #{count} profiles on queue every 10 secs"
  
  while(true)
    offset = rand 1..safe_total
    Profile.offset(offset).limit(count).each{|p| Indexer.perform_async(p.id.to_s)} 
    total += count
    puts "[#{Time.now}] - Enqueued #{total} job up tp know in #{Time.now - start_at} seconds"
    sleep 10
  end  
  
end  
