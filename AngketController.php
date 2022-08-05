<?php

namespace App\Http\Controllers;

use App\Models\AngketModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Inertia\Inertia;

class AngketController extends Controller
{
    public function index(Request $request)
    {
        $queryX = "
                    (select `RESPONDEN`, SUM(NILAI) AS NILAI 
                    from `NILAI_ANGKET` 
                    where `VARIABLE` = 'X' 
                    group by `RESPONDEN`) as sub";

        $sumX = AngketModel::select('RESPONDEN', DB::raw('SUM(NILAI) AS NILAI'))
                    ->where("VARIABLE", "!=", "Y")
                    ->groupBy('RESPONDEN')
                    ->orderByRaw('SUM(NILAI) ASC');

        # Menentukan Rentang
        $rentangX = DB::select("SELECT F_RENTANG('X') as RENTANG");
        $renX = 0;
        foreach ($rentangX as $rX) {
            $renX = $rX->RENTANG;
        }

        # Menentukan Banyak Kelas Interval (BK)
        $intervalX = DB::select("SELECT F_COUNTINTERVAL('X') BANYAK_INTERVAL");
        $intvX = 0;
        foreach ($intervalX as $invX) {
            $intvX = $invX->BANYAK_INTERVAL;
        }

        # Menentukan Panjang Interval Kelas (I)
        $invKelasX = DB::select("SELECT F_LENGTHINTERVAL('X') PANJANG_INTERVAL");
        $intvlengtX = 0;
        foreach ($invKelasX as $invlengX) {
            $intvlengtX = $invlengX->PANJANG_INTERVAL;
        }

        # Menghitung Rata-rata Hitung
        $rataX = DB::select("SELECT F_RATA_RATA('X') RATA_X");
        $nilaiRataX = 0;
        foreach ($rataX as $nAvgX) {
            $nilaiRataX = $nAvgX->RATA_X;
        }

        # Menghitung Jumlah Simpangan Rata-rata X
        $simpangX = DB::select("SELECT F_SIMPANGAN('X') SIMPANG_X");
        $nilaiSimpangX = 0;
        foreach ($simpangX as $nSimpX) {
            $nilaiSimpangX = $nSimpX->SIMPANG_X;
        }

        return Inertia::render('Angket', [
            'no_soal'  => AngketModel::distinct()->get('PARAMETERS'),
            'responden' => AngketModel::distinct()->get('RESPONDEN'),
            'angketListX' => AngketModel::all(),
            'nX' => AngketModel::distinct()->count('RESPONDEN'),
            'maxX' => DB::table(DB::raw("{$queryX}"))->max('NILAI'),
            'minX'  => DB::table(DB::raw("{$queryX}"))->min('NILAI'),
            'sortX' => DB::table('REKAP_X')->select('TOTAL AS NILAI')->orderBy('TOTAL')->get(),
            'rekapX' => DB::table('REKAP_X')->get(),
            'rentangX' => $renX,
            'cIntvX' => $intvX,
            'lenIntX' => $intvlengtX,
            'distribX' => DB::table('DISTRIBUSI_X')->get(),
            'sumDistribX' => DB::table('DISTRIBUSI_X')->sum('JML_RATA_RATA'),
            'avgSumX' => $nilaiRataX,
            'simpangX' => DB::table('SIMPANGAN_AVG_X')->get(),
            'sumSimpangX' => DB::table('SIMPANGAN_AVG_X')->sum('FI_RATA'),
            'nilaiSimpangX' => $nilaiSimpangX,
        ]);
    }

    public function varY(Request $request)
    {
        $queryX = "
                    (select `RESPONDEN`, SUM(NILAI) AS NILAI 
                    from `NILAI_ANGKET` 
                    where `VARIABLE` = 'Y' 
                    group by `RESPONDEN`) as sub";

        $sumX = AngketModel::select('RESPONDEN', DB::raw('SUM(NILAI) AS NILAI'))
                    ->where("VARIABLE", "!=", "X")
                    ->groupBy('RESPONDEN')
                    ->orderByRaw('SUM(NILAI) ASC');

        # Menentukan Rentang
        $rentangX = DB::select("SELECT F_RENTANG('Y') as RENTANG");
        $renX = 0;
        foreach ($rentangX as $rX) {
            $renX = $rX->RENTANG;
        }

        # Menentukan Banyak Kelas Interval (BK)
        $intervalX = DB::select("SELECT F_COUNTINTERVAL('Y') BANYAK_INTERVAL");
        $intvX = 0;
        foreach ($intervalX as $invX) {
            $intvX = $invX->BANYAK_INTERVAL;
        }

        # Menentukan Panjang Interval Kelas (I)
        $invKelasX = DB::select("SELECT F_LENGTHINTERVAL('Y') PANJANG_INTERVAL");
        $intvlengtX = 0;
        foreach ($invKelasX as $invlengX) {
            $intvlengtX = $invlengX->PANJANG_INTERVAL;
        }

        # Menghitung Rata-rata Hitung
        $rataX = DB::select("SELECT F_RATA_RATA('Y') RATA_Y");
        $nilaiRataX = 0;
        foreach ($rataX as $nAvgX) {
            $nilaiRataX = $nAvgX->RATA_Y;
        }

        # Menghitung Jumlah Simpangan Rata-rata X
        $simpangX = DB::select("SELECT F_SIMPANGAN('Y') SIMPANG_Y");
        $nilaiSimpangX = 0;
        foreach ($simpangX as $nSimpX) {
            $nilaiSimpangX = $nSimpX->SIMPANG_Y;
        }

        return Inertia::render('AngketY', [
            'no_soal'  => AngketModel::distinct()->get('PARAMETERS'),
            'responden' => AngketModel::distinct()->get('RESPONDEN'),
            'angketListX' => AngketModel::all(),
            'nX' => AngketModel::distinct()->count('RESPONDEN'),
            'maxX' => DB::table(DB::raw("{$queryX}"))->max('NILAI'),
            'minX'  => DB::table(DB::raw("{$queryX}"))->min('NILAI'),
            'sortX' => DB::table('REKAP_Y')->select('TOTAL AS NILAI')->orderBy('TOTAL')->get(),
            'rekapX' => DB::table('REKAP_Y')->get(),
            'rentangX' => $renX,
            'cIntvX' => $intvX,
            'lenIntX' => $intvlengtX,
            'distribX' => DB::table('DISTRIBUSI_Y')->get(),
            'sumDistribX' => DB::table('DISTRIBUSI_Y')->sum('JML_RATA_RATA'),
            'avgSumX' => $nilaiRataX,
            'simpangX' => DB::table('SIMPANGAN_AVG_Y')->get(),
            'sumSimpangX' => DB::table('SIMPANGAN_AVG_Y')->sum('FI_RATA'),
            'nilaiSimpangX' => $nilaiSimpangX,
        ]);
    }

    public function varXY(Request $request)
    {
        $qRankX = DB::statement(DB::raw('set @row:=0'));
        $rankX = DB::table(DB::raw("(SELECT (@row_number:=@row_number + 1) AS POSISI, TOTAL, F_IMBUHAN('X', TOTAL) as IMBUHAN FROM REKAP_X ORDER BY TOTAL DESC ) AS X"))->get();
        $rankY = DB::table(DB::raw("(SELECT (@row_number:=@row_number + 1) AS POSISI, TOTAL, F_IMBUHAN('Y', TOTAL) as IMBUHAN FROM REKAP_Y ORDER BY TOTAL DESC ) AS X"))->get();
        return Inertia::render('AngketXY', [
            'sortX' => DB::table('REKAP_X')->select('TOTAL AS NILAI')->orderBy('TOTAL')->get(),
            'sortY' => DB::table('REKAP_Y')->select('TOTAL AS NILAI')->orderBy('TOTAL')->get(),
            'rankX' =>  DB::table('RANGKING_X')->get(),
            'rankY' => DB::table('RANGKING_Y')->get(),
            'diffRank' => DB::table('BEDA_RANGKING')->get(),
            'sumDI2' => DB::table('BEDA_RANGKING')->sum('DI2'),
            'korelasi' => DB::select('SELECT F_KORELASI() AS KORELASI'),
            'derajat' => DB::select('SELECT POW(F_KORELASI(), 2) * 100 AS DERAJAT'),
            'hipotesis' => DB::select('SELECT F_HIPOTESIS() AS HIPOTESIS'),
        ]);
    }
}
