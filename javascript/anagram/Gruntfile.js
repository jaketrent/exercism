/*global module:false*/
module.exports = function(grunt) {
  grunt.initConfig({
    jasmine_node: {
      specNameMatcher: "spec",
      projectRoot: ".",
      requirejs: false,
      forceExit: true,
      jUnit: {
          report: false,
          savePath : "./build/reports/jasmine/",
          useDotNotation: true,
          consolidate: true
      }
    },
    watch: {
      default: {
        files: './*.js',
        tasks: ['jasmine_node']
      }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-jasmine-node');


  grunt.registerTask('default', ['jasmine_node']);

};
