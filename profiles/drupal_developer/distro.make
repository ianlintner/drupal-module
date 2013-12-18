; Copied from Commerce Kickstart
; Use this file to build a full distribution including Drupal core and the
; Drupal Developer install profile using the following command:
;
; drush make distro.make <target directory>

api = 2
core = 7.x

projects[drupal][type] = core
projects[drupal][version] = "7"

; Add Commerce Kickstart to the full distribution build.
projects[drupal_developer][type] = profile
projects[drupal_developer][version] = 1.x-dev
projects[drupal_developer][download][type] = git
projects[drupal_developer][download][url] = http://git.drupal.org/project/drupal_developer.git
projects[drupal_developer][download][branch] = 7.x-1.x
