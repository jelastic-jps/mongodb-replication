//@req(enable)

if (jelastic.environment.security && jelastic.env.control.GetEnvInfo('${env.appid}', session).env.isFirewallEnabled == true) {
  return jelastic.environment.security.SetFirewallEnabled('${env.appid}', session, enable);
}

return {
  result: 0
}
