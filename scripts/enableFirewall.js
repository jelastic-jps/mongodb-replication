//@req(enable)

if (jelastic.environment.security.SetFirewallEnabled) {
  return jelastic.environment.security.SetFirewallEnabled('${env.appid}', session, enable);
}

return {
  result: 0
}
