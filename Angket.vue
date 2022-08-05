<template>
    <div class="container mx-auto">
        <h3 class="text-center text-xl font-bold">Variable X</h3>
        <table class="border" border="1px">
            <thead>
                <tr>
                    <th rowspan="2">No</th>
                    <th colspan="15">Item Soal</th>
                    <th rowspan="2">Jumlah</th>
                </tr>
                <tr>
                    <th v-for="soal in no_soal" class="p-2">{{ soal.PARAMETERS }}</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="respon in rekapX">
                   <td>{{ respon.RESPONDEN }}</td>
                   <td>{{ respon.P1 }}</td>
                   <td>{{ respon.P2 }}</td>
                   <td>{{ respon.P3 }}</td>
                   <td>{{ respon.P4 }}</td>
                   <td>{{ respon.P5 }}</td>
                   <td>{{ respon.P6 }}</td>
                   <td>{{ respon.P7 }}</td>
                   <td>{{ respon.P8 }}</td>
                   <td>{{ respon.P9 }}</td>
                   <td>{{ respon.P10 }}</td>
                   <td>{{ respon.P11 }}</td>
                   <td>{{ respon.P12 }}</td>
                   <td>{{ respon.P13 }}</td>
                   <td>{{ respon.P14 }}</td>
                   <td>{{ respon.P15 }}</td>
                   <td>{{ respon.TOTAL }}</td> 
                </tr>
            </tbody>
        </table>

        <div class="flex flex-col justify-center p-8">
            <div class="flex">
                <p>
                    Dari angket yang disebarkan dengan skala pengukuran ordinal sebanyak 10 item dan 5 opsi jawaban, maka nilai tertinggi (H) sebesar {{ maxX }} dan nilai terendah (L) sebesar {{ minX }}.
                </p>
            </div>
            <div class="grid grid-cols-3">
                <span>N (Jumlah data)</span>
                <span> = </span>
                <span class="font-bold"> {{ nX }}</span>
            </div>
            <div class="grid grid-cols-3">
                <span>H (Nilai tertinggi)</span>
                <span> = </span>
                <span class="font-bold"> {{ maxX }}</span>
            </div>
            <div class="grid grid-cols-3">
                <span>L (Nilai Terendah)</span>
                <span> = </span>
                <span class="font-bold"> {{ minX }}</span>
            </div>
        </div>

         <div class="flex flex-col p-8">
            <h1>1) Hasil Skoring data X</h1>
            <div class="flex flex-row">
                <div class="grid grid-cols-12 gap-4">
                    <span v-for="x in sortX">{{ x.NILAI }}</span>
                </div>
            </div>
        </div>

        <div class="flex flex-col p-8">
            <h1>2) Menentukan Rentang (R)</h1>
            <div class="flex flex-col">
                <span>R = H – L</span>
                <span class="ml-4">= {{ maxX }} - {{minX}}</span>
                <span class="ml-4">= {{ rentangX }}</span>
            </div>
        </div>

        <div class="flex flex-col p-8">
            <h1>3) Menentukan Banyak Kelas Interval (BK)</h1>
            <div class="flex flex-col">
                <span>BK = 1 + 3,3 Log N</span>
                <span class="ml-4">= 1 + 3,3 Log {{ nX }}</span>
                <span class="ml-4">= 1 + 3,3 Log {{ Math.log10(nX).toFixed(3) }}</span>
                <span class="ml-4">= 1 + {{ 3.3 * Math.log10(nX).toFixed(3) }}</span>
                <span class="ml-4">= {{ cIntvX.toFixed(3) }}</span>
                <span class="ml-4">= {{ Math.round(cIntvX) }} (dibulatkan)</span>
            </div>
        </div>

         <div class="flex flex-col p-8">
            <h1>4) Menentukan Panjang Interval Kelas (I)</h1>
            <div class="flex flex-col">
                <span>I = 𝑅/𝐵𝑘</span>
                <span class="ml-4"> = {{ rentangX }} / {{ Math.round(cIntvX) }}</span>
                <span class="ml-4"> = {{ lenIntX }} </span>
                <span class="ml-4"> = {{ Math.ceil(lenIntX) }} </span>
            </div>
        </div>

         <div class="flex flex-col p-8">
            <h1>5) Menentukan Tabel Distribusi Frekuensi</h1>
            <div class="flex flex-col">
                <table>
                    <thead>
                        <tr>
                            <th>Skor</th>
                            <th>Tally</th>
                            <th>Fi</th>
                        </tr>
                    </thead>
                    <tbody >
                        <tr v-for="xdist in distribX"> 
                            <td class="text-center">{{ xdist.TOTAL }}</td>
                            <td class="text-center">{{ this.makeTally(xdist.JML_RES) }}</td>
                            <td class="text-center">{{ xdist.JML_RES }}</td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="2" class="text-center">Jumlah</td>
                            <td>{{nX}}</td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>

        <div class="flex flex-col p-8">
            <h1>6) Menghitung Rata-rata Hitung</h1>
            <div class="flex flex-col">
                <table>
                <thead>
                    <tr>
                        <th>Skor</th>
                        <th>Fi</th>
                        <th>xi</th>
                        <th>Fi xi</th>
                    </tr>
                </thead>
                <tbody >
                    <tr v-for="xRata in distribX"> 
                        <td class="text-center">{{ xRata.TOTAL }}</td>
                        <td class="text-center">{{ xRata.JML_RES }}</td>
                        <td class="text-center">{{ parseInt( xRata.RATA_RATA ) }}</td>
                        <td class="text-center">{{ parseInt( xRata.JML_RATA_RATA ) }}</td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <td class="text-center font-bold">𝜮</td>
                        <td class="text-center font-bold">{{nX}}</td>
                        <td></td>
                        <td class="text-center font-bold">{{ parseInt( sumDistribX ) }}</td>
                    </tr>
                </tfoot>
            </table>
            </div>
            <div class="flex flex-col mt-4">
                <span>Maka diperoleh :</span>
                <span>𝑥̅ = Σ𝑓𝑖𝑥ⅈ / 𝛴𝑓𝑖</span>
                <span class="ml-4">  = {{ parseInt( sumDistribX )}} / {{ nX }}</span>
                <span class="ml-4">  = {{ avgSumX }}</span>
            </div>
        </div>

        <div class="flex flex-col p-8">
            <h1>7) Menghitung Simpang Rata-rata</h1>
            <div class="flex flex-col">
                <table>
                    <thead>
                        <tr>
                            <th>Skor</th>
                            <th>fi</th>
                            <th>xi</th>
                            <th>X</th>
                            <th>xi-x</th>
                            <th>|𝒙𝒊−𝒙|</th>
                            <th>𝒇𝒊 |𝒙𝒊−𝒙|</th>
                        </tr>
                    </thead>
                    <tbody >
                        <tr v-for="avgX in simpangX">
                            <td class="text-center">{{ avgX.TOTAL }}</td>
                            <td class="text-center">{{ avgX.JML_RES }}</td>
                            <td class="text-center">{{ avgX.RATA_RATA}}</td>
                            <td class="text-center">{{ avgX.X}}</td>
                            <td class="text-center">{{ avgX.XIX.toFixed(2)}}</td>
                            <td class="text-center">{{ avgX.ABS_XIX.toFixed(2)}}</td>
                            <td class="text-center">{{ avgX.FI_RATA.toFixed(2)}}</td>
                        </tr>
                    </tbody>
                    <tbody>
                        <tr>
                            <td>𝜮</td>
                            <td>{{nX}}</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>{{ sumSimpangX }}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="flex flex-col">
                <span>𝑆𝑅 = Σ| 𝑥 ⅈ−𝑥ⅈ.𝑓ⅈ / Σ𝑓ⅈ</span>
                <span class="ml-4"> = {{ sumSimpangX.toFixed(2) }} / {{ nX }}</span>
                <span class="ml-4"> = {{ nilaiSimpangX.toFixed(2) }}</span>
            </div>
        </div>

        <div class="flex flex-col p-8">
            <h1>8) Membuat skala penafsiran dengan banyaknya tingkatan skala mengacu kepada banyaknya Option dalam angket.</h1>
            <div class="flex flex-col">
                <div>________________________Sangat Baik</div>
                <div class="flex flex-col">
                    Skor Min + 3 SR
                    {{ minX }} + 3({{ nilaiSimpangX.toFixed(2) }}) = {{ callScale(3) }}
                </div>
                <div>________________________Baik</div>
                <div class="flex flex-col">
                    Skor Min + 2 SR
                    {{ minX }} + 2({{ nilaiSimpangX.toFixed(2) }}) = {{ callScale(2) }}
                </div>
                <div>________________________Cukup</div>
                <div class="flex flex-col">
                    Skor Min + 1 SR
                    {{ minX }} + 1({{ nilaiSimpangX.toFixed(2) }}) = {{ callScale(1) }}
                </div>
                <div>________________________Rendah</div>
            </div>
        </div>

        <div class="flex flex-col p-8">
            <h1>9) Interpretasi Rata-rata Hitung pada Skala Penafsiran</h1>
            <div class="flex flex-col">
                <p>
                    Berdasarkan skala penafsiran tersebut, maka rata-rata hitung adalah 𝑥̅ = <span class="font-bold">{{ avgSumX.toFixed(2) }}</span> berada pada klasifikasi cukup (Interval {{callScale(2)}}, - {{callScale(3)}}). Hal ini berarti xxxx yang ada di lingkungan Ponpes Al-Khoeriyyah tergolong kategori <span class="font-bold">baik</span>
                </p>
            </div>
        </div>
    </div>

</template>

<script>
    export default {
        props:{
            no_soal:{    
                type:Object,
                default:[]
            },
            responden: Object,
            angketListX: Object,
            nX: Number,
            maxX: Number,
            minX: Number,
            sortX: Object,
            rekapX: Object,
            rentangX: Number,
            cIntvX: Number,
            lenIntX: Number,
            distribX: Object,
            sumDistribX: Number,
            avgSumX: Number,
            simpangX: Object,
            sumSimpangX: Number,
            nilaiSimpangX: Number,
        },
        created() {
            console.log(this.distribX)
        },
        data() {
            return {
                sumAvgVal: 0,
            }
        },
        methods:{
            countResponden(start, end){
                let sortRes = this.sortX.filter(x => x.NILAI >= start && x.NILAI <= end);
                return sortRes.length;
            },
            makeTally(longTally) {
                let tally = "";
                for (let i= 1; i<=longTally; i++) { 
                    if(i % 5 == 0){
                        tally += "I ";
                    }else{
                        tally += "I";
                    }
                }
                return tally;
            },
            callScale(scale){
                let res = parseInt(this.minX) + (scale * parseFloat(this.nilaiSimpangX));
                return res.toFixed(2);
            }
        },
    }
</script>