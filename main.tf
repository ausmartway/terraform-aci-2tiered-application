##main.tf
resource "aci_application_profile" "application_profile" {
  tenant_dn = var.tenant_id
  name      = var.application_name
}

resource "aci_application_epg" "tier1" {
  name                   = "${var.application_name}-tier1"
  application_profile_dn = aci_application_profile.application_profile.id
  relation_fv_rs_bd      = var.bridge_domain
  relation_fv_rs_prov    = [aci_contract.contract.id]
}

resource "aci_application_epg" "tier2" {
  name                   = "${var.application_name}-tier2"
  application_profile_dn = aci_application_profile.application_profile.id
  relation_fv_rs_bd      = var.bridge_domain
  relation_fv_rs_prov    = [aci_contract.contract.id]
}

#Contract Definitions
resource "aci_contract" "contract" {
  tenant_dn = var.tenant_id
  name      = "${var.application_name}-contract"
  scope     = "tenant"
}

# Subject Definitions

resource "aci_contract_subject" "contractSubject" {
  contract_dn                  = aci_contract.contract.id
  name                         = "${var.application_name}-contractSubject"
  relation_vz_rs_subj_filt_att = module.contractfilters.filterList
}

module "contractfilters" {
  source  = "app.terraform.io/yulei/contractfilters/aci"
  version = "0.0.7"
  # insert required variables here
  tenant_id = var.tenant_id
  openports = var.openports
}
