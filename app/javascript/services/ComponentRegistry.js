const ComponentRegistry = {
  registry: {},
  register(key, klass) {
    this.registry[key] = klass;
  },
  get(key) {
    return this.registry[key];
  }
};

export default ComponentRegistry;
