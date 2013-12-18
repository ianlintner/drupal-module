<?php
/**
 * @file
 * Install profile for a developer setup
 */

/*
 * Implementation of hook_form_alter().
 */
function drupal_developer_form_install_configure_form_alter(&$form, $form_state) {
  drupal_set_message(t('Admin username and password are provided by the profile: username: admin, password: drupal.'), 'notice');
 // Remove any port part of the host, otherwise the email addresses do not validate.
 $host = ($pos = strpos($_SERVER['HTTP_HOST'], ':')) ? substr($_SERVER['HTTP_HOST'], 0, $pos) : $_SERVER['HTTP_HOST'];
 $host = 'example.com'; // Unfortunately domains like 'localhost' are no longer accepted.
 // Site information form.
 $form['site_information']['#collapsible'] = TRUE;
 $form['site_information']['#collapsed'] = TRUE;
 $form['site_information']['site_name']['#default_value'] = 'Drupal Devel';
 $form['site_information']['site_mail']['#default_value'] = 'admin@'. $host;

 // Administrator account form.
 $form['admin_account']['#collapsible'] = TRUE;
 $form['admin_account']['#collapsed'] = TRUE;
 $form['admin_account']['account']['name']['#default_value'] = 'admin';
 $form['admin_account']['account']['mail']['#default_value'] = 'admin@'. $host;
 $form['admin_account']['account']['pass'] = array(
   '#type' => 'value',
   '#value' => 'drupal',
 );

 // Collapse the server settings form.
 $form['server_settings']['#collapsible'] = TRUE;
 $form['server_settings']['#collapsed'] = TRUE;

 // Unset the send email notifications.
 $form['update_notifications']['#collapsible'] = TRUE;
 $form['update_notifications']['#collapsed'] = TRUE;
 $form['update_notifications']['update_status_module']['#default_value'][1] = 0;
}
