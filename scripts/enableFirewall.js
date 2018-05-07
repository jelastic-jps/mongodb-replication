//@req(enable)

if (jelastic.environment.security) {
  return jelastic.environment.security.SetFirewallEnabled('${env.appid}', session, enable);
}

return {
  result: 0
}
