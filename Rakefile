#!/usr/bin/env rake

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

task default: :major

