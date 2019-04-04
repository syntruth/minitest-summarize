Gem::Specification.new do |s|
  s.name        = 'minitest-summarize'
  s.version     = '0.0.3'
  s.authors     = 'Randy Carnahan'
  s.homepage    = 'https://github.com/syntruth/minitest-summarize'
  s.licenses    = ['MIT']
  s.date        = '2018-10-12'
  s.summary     = 'Minitest Summarize Reporter'
  s.description = 'Reduces the output from the standard Minitest run.'
  s.email       = 'syntruth@gmail.com'

  s.files = [
    'README.md',
    'LICENSE',
    'VERSION',
    'lib/minitest/summarize.rb',
    'lib/minitest/summarize_plugin.rb',
    'lib/minitest/summarize_reporter.rb'
  ]

  s.require_paths = ['lib']
end
