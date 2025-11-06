node {
    // Menjalankan di dalam container docker node:16-buster-slim
    docker.image('node:16-buster-slim').inside('-p 3000:3000') {

        stage('Build') {
            sh 'npm install'
        }

        stage('Test') {
            sh './jenkins/scripts/test.sh'
        }
stage('Manual Approval') {
        input message: 'Lanjutkan ke tahap Deploy?', ok: 'Proceed'
}
        stage('Deploy') {
        echo 'Menjalankan aplikasi React...'
        sh './jenkins/scripts/deliver.sh' // build & start app

        echo 'Menjeda pipeline selama 1 menit agar app bisa diuji...'
        sh 'sleep 60' // jeda 1 menit (60 detik)

        echo 'Menghentikan aplikasi setelah 1 menit berjalan...'
        sh './jenkins/scripts/kill.sh' // stop app pakai PID
}

    }
}
