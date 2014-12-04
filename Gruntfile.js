module.exports = function(grunt) {
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-contrib-jade');
    grunt.loadNpmTasks('grunt-contrib-stylus');
    grunt.loadNpmTasks('grunt-shell');

    grunt.initConfig({
        /* for live reload, select which files to watch */
        watch: {
            livereload: {
                files: [],
                options: { livereload: true },
            },
            coffee: {
                files: ['coffee/**/*.coffee'],
                tasks: ['coffee:compile']
            },
            jade: {
                files: ['views/**/*.jade'],
                tasks: ['jade:compile']
            },
            stylus: {
                files: ['stylus/**/*.styl'],
                tasks: ['stylus:compile']
            }
        },
        /* select jade files to compile */
        jade: {
            compile: {
                options: {
                    pretty: true
                },
                files: [{
                    expand: true,
                    cwd: "views/",
                    src: ['**/partials/*.jade'],
                    dest: './public/',
                    ext: '.html'
                }]
            }
        }
    });

    grunt.registerTask('build', ['jade'])
};
