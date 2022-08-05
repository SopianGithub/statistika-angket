<template>
    <div class="contianer mx-auto">
        <div class="flex flex-col p-8">
            <h1>1) Hasil Skoring data X & Y</h1>
            <h3>a) Variable X</h3>
            <div class="flex flex-row">
                <div class="grid grid-cols-12 gap-4">
                    <span v-for="x in sortX">{{ x.NILAI }}</span>
                </div>
            </div>
            <h3 class="mt-4">b) Variable Y</h3>
            <div class="flex flex-row">
                <div class="grid grid-cols-12 gap-4">
                    <span v-for="y in sortY">{{ y.NILAI }}</span>
                </div>
            </div>
        </div>

        <div class="flex flex-col p-8">
            <h1>Susunan Posisi Imbuhan Rangking dan Rangking Data</h1>
            <h3>a) Variable X</h3>
            <table>
                <thead>
                    <tr>
                        <th>Susunan Data</th>
                        <th>Posisi</th>
                        <th>Imbuhan</th>
                        <th>Ranking</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(val, key) in rankX">
                        <td>{{ val.TOTAL }}</td>
                        <td>{{ val.POSISI }}</td>
                        <td>{{ val.IMBUHAN.toFixed(2) }}</td>
                        <td>{{ val.RANGKING.toFixed(2) }}</td>
                        <!-- <td>{{ setRangkingX(val.TOTAL, key+1, val.IMBUHAN.toFixed(1)) }}</td> -->
                    </tr>
                </tbody>
            </table>
            <h3>b) Variable Y</h3>
            <table>
                <thead>
                    <tr>
                        <th>Susunan Data</th>
                        <th>Posisi</th>
                        <th>Imbuhan</th>
                        <th>Ranking</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(val, key) in rankY">
                        <td>{{ val.TOTAL }}</td>
                        <td>{{ val.POSISI }}</td>
                        <td>{{ val.IMBUHAN.toFixed(2) }}</td>
                        <td>{{ val.RANGKING.toFixed(2) }}</td>
                        <!-- <td>{{ setRangkingY(val.TOTAL, key+1, val.IMBUHAN.toFixed(1)) }}</td> -->
                    </tr>
                </tbody>
            </table>

            <h3>c) Mencari Beda Rangking</h3>
            <table>
                <thead>
                    <tr>
                        <th>No</th>
                        <th>X</th>
                        <th>Y</th>
                        <th>RX</th>
                        <th>RY</th>
                        <th>di</th>
                        <th>di2</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(val, key) in diffRank">
                        <td>{{ val.RESPONDEN }}</td>
                        <td>{{ val.X }}</td>
                        <td>{{ val.Y }}</td>
                        <td>{{ val.RX.toFixed(2) }}</td>
                        <td>{{ val.RY.toFixed(2) }}</td>
                        <td>{{ val.DI.toFixed(2) }}</td>
                        <td>{{ val.DI2.toFixed(2) }}</td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="6">Jumlah</td>
                        <td class="font-bold">{{sumDI2.toFixed(2)}}</td>
                    </tr>
                </tfoot>
            </table>

            <h3>d) Menghitung Korelasi antara Variabel (X) dan variabel (Y)</h3>
            <div class="flex flex-col">
                rs = {{ korelasi }}
            </div>

            <h3>e) Menentukan Derajat Determinasi</h3>
            <div class="flex flex-col">
                D = {{ derajat }}
            </div>

            <h3>f) Uji Signifikas / Uji Hipotesis</h3>
            <div class="flex flex-col">
                t = {{ hipotesis }}
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        props:{
            sortX: Object,
            sortY: Object,
            rankX: Object,
            rankY: Object,
            diffRank: Object,
            sumDI2: Number,
            korelasi: Object,
            derajat: Object,
            hipotesis: Object,
        },
        created() {
            console.log(this.rankX);
        }, 
        data() {
            return {
                tmpDataX: this.rankX[0]['TOTAL'],
                tmpPosisiX: 1,
                tmpDataY: this.rankY[0]['TOTAL'],
                tmpPosisiY: 1,
            }
        },
        methods:{
            setRangkingX(data, posisi, imbuhan){
                if(this.tmpDataX != data){
                    this.tmpDataX = data;
                    this.tmpPosisiX = posisi;
                }

                if(imbuhan == 1){
                    return posisi;
                }else{
                    return parseInt(this.tmpPosisiX) + parseFloat(imbuhan);
                }  
            },
            setRangkingY(data, posisi, imbuhan){
                if(this.tmpDataY != data){
                    this.tmpDataY = data;
                    this.tmpPosisiY = posisi;
                }

                if(imbuhan == 1){
                    return posisi;
                }else{
                    return parseInt(this.tmpPosisiY) + parseFloat(imbuhan);
                }  
            }
        } 
    }
</script>