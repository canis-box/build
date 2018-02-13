#!/usr/bin/env rake

SRC_REGEX = %r(src/(\w*)\.json)
src_files = FileList['src/*.json']
src_files.each do |src_file|
  m = SRC_REGEX.match(src_file)
  name = m[1]
  box_file = "#{name}.virtualbox.box"
  file box_file => src_file do
    sh "packer build ${src_file}"
  end
end

file 'minor.virtualbox.box' => 'minor.json' do
  sh "packer build minor.json"
  sh "vagrant box add --force --name=test/minor ./minor.virtualbox.box"
end

file 'major.virtualbox.box' => ['minor.json', 'minor.virtualbox.box'] do
  sh "packer build major.json"
  sh "vagrant box add --force --name=test/minor ./minor.virtualbox.box"
  sh "cd major; vagrant destroy -f; vagrant up"
end

desc "Build the canis minor box"
task minor: 'minor.virtualbox.box'

desc "Build the canis major box"
task major: 'major.virtualbox.box'

# task default: :major

