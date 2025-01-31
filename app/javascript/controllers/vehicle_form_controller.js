import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["year", "make", "model", "trim"]

  connect() {
    console.log("Vehicle form controller connected")
  }

  yearChanged(event) {
    const year = event.target.value
    if (!year) return

    // Clear and disable dependent dropdowns
    this.resetDropdown(this.makeTarget, "Make")
    this.resetDropdown(this.modelTarget, "Model")
    this.resetDropdown(this.trimTarget, "Trim")

    // Generate random makes based on year
    const makes = this.generateMakes(year)
    this.populateDropdown(this.makeTarget, makes)
    this.makeTarget.disabled = false
  }

  makeChanged(event) {
    const make = event.target.value
    if (!make) return

    // Clear and disable dependent dropdowns
    this.resetDropdown(this.modelTarget, "Model")
    this.resetDropdown(this.trimTarget, "Trim")

    // Generate random models based on make
    const models = this.generateModels(make)
    this.populateDropdown(this.modelTarget, models)
    this.modelTarget.disabled = false
  }

  modelChanged(event) {
    const model = event.target.value
    if (!model) return

    // Clear trim dropdown
    this.resetDropdown(this.trimTarget, "Trim")

    // Generate random trims based on model
    const trims = this.generateTrims(model)
    this.populateDropdown(this.trimTarget, trims)
    this.trimTarget.disabled = false
  }

  // Helper methods
  generateMakes(year) {
    // Sample makes with year-specific variations
    const baseMakes = ["Toyota", "Honda", "Ford", "Chevrolet", "BMW", "Mercedes", "Audi"]
    return baseMakes.map(make => ({
      value: make.toLowerCase(),
      label: `${make} (${year})`
    }))
  }

  generateModels(make) {
    // Sample models based on make
    const modelsByMake = {
      toyota: ["Camry", "Corolla", "RAV4", "Highlander"],
      honda: ["Civic", "Accord", "CR-V", "Pilot"],
      ford: ["F-150", "Mustang", "Explorer", "Escape"],
      chevrolet: ["Silverado", "Malibu", "Equinox", "Tahoe"],
      bmw: ["3 Series", "5 Series", "X3", "X5"],
      mercedes: ["C-Class", "E-Class", "GLC", "GLE"],
      audi: ["A4", "A6", "Q5", "Q7"]
    }
    
    const models = modelsByMake[make] || []
    return models.map(model => ({
      value: model.toLowerCase().replace(/\s+/g, '-'),
      label: model
    }))
  }

  generateTrims(model) {
    // Generic trims that could apply to most models
    const baseTrims = ["Base", "Sport", "Limited", "Premium"]
    return baseTrims.map(trim => ({
      value: trim.toLowerCase(),
      label: trim
    }))
  }

  resetDropdown(dropdown, placeholder) {
    dropdown.innerHTML = `<option value="">${placeholder}</option>`
    dropdown.disabled = true
  }

  populateDropdown(dropdown, options) {
    const currentOptions = dropdown.innerHTML
    const newOptions = options.map(option => 
      `<option value="${option.value}">${option.label}</option>`
    ).join('')
    
    dropdown.innerHTML = currentOptions + newOptions
  }
} 