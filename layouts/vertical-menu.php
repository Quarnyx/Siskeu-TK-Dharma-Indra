<header id="page-topbar">
    <div class="navbar-header">
        <div class="d-flex">
            <!-- LOGO -->
            <div class="navbar-brand-box">
                <a href="index.php" class="logo logo-dark">
                    <span class="logo-sm">
                        <img src="assets/images/logo-sm.svg" alt="" height="24">
                    </span>
                    <span class="logo-lg">
                        <img src="assets/images/logo-sm.svg" alt="" height="24"> <span class="logo-txt">TK Dharma
                            Indra</span>
                    </span>
                </a>

                <a href="index.php" class="logo logo-light">
                    <span class="logo-sm">
                        <img src="assets/images/logo-sm.svg" alt="" height="24">
                    </span>
                    <span class="logo-lg">
                        <img src="assets/images/logo-sm.svg" alt="" height="24"> <span class="logo-txt">TK Dharma
                            Indra</span>
                    </span>
                </a>
            </div>

            <button type="button" class="btn btn-sm px-3 font-size-16 header-item" id="vertical-menu-btn">
                <i class="fa fa-fw fa-bars"></i>
            </button>

        </div>

        <div class="d-flex">



            <div class="dropdown d-none d-sm-inline-block">
                <button type="button" class="btn header-item" id="mode-setting-btn">
                    <i data-feather="moon" class="icon-lg layout-mode-dark"></i>
                    <i data-feather="sun" class="icon-lg layout-mode-light"></i>
                </button>
            </div>



            <div class="dropdown d-inline-block">
                <button type="button" class="btn header-item right-bar-toggle me-2">
                    <i data-feather="settings" class="icon-lg"></i>
                </button>
            </div>

            <div class="dropdown d-inline-block">
                <button type="button" class="btn header-item bg-light-subtle border-start border-end"
                    id="page-header-user-dropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <img class="rounded-circle header-profile-user"
                        src="pages/pengguna/foto-pengguna/<?php echo $_SESSION['foto_pengguna']; ?>"
                        alt="Header Avatar">
                    <span class="d-none d-xl-inline-block ms-1 fw-medium"><?php echo $_SESSION['nama']; ?>.</span>
                    <i class="mdi mdi-chevron-down d-none d-xl-inline-block"></i>
                </button>
                <div class="dropdown-menu dropdown-menu-end">
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="logout.php"><i
                            class="mdi mdi-logout font-size-16 align-middle me-1"></i>
                        <?php echo $language["Logout"]; ?></a>
                </div>
            </div>

        </div>
    </div>
</header>

<!-- ========== Left Sidebar Start ========== -->
<!-- ========== Left Sidebar Start ========== -->
<div class="vertical-menu">

    <div data-simplebar class="h-100">

        <!--- Sidemenu -->
        <div id="sidebar-menu">
            <!-- Left Menu Start -->
            <ul class="metismenu list-unstyled" id="side-menu">
                <li class="menu-title" data-key="t-menu"><?php echo $language["Menu"]; ?></li>

                <li>
                    <a href="?page=home">
                        <i data-feather="home"></i>
                        <span data-key="t-dashboard">Home</span>
                    </a>
                </li>
                <?php
                if ($_SESSION['level'] == "Kepala Sekolah" || $_SESSION['level'] == "Bendahara" || $_SESSION['level'] == "Sekretaris") {

                    ?>
                    <?php
                    if ($_SESSION['level'] == "Kepala Sekolah" || $_SESSION['level'] == "Bendahara") {

                        ?>
                        <li>
                            <a href="javascript: void(0);" class="has-arrow">
                                <i data-feather="grid"></i>
                                <span data-key="t-apps">Master Data</span>
                            </a>
                            <ul class="sub-menu" aria-expanded="false">
                                <li>
                                    <?php if ($_SESSION['level'] == "Kepala Sekolah") { ?>
                                        <a href="?page=pengguna">
                                            <span data-key="t-chat">Pengguna</span>
                                        </a>
                                    <?php } ?>
                                    <?php if ($_SESSION['level'] == "Bendahara") { ?>
                                        <a href="?page=akun">
                                            <span data-key="t-calendar">Akun Keuangan</span>
                                        </a>
                                        <a href="?page=guru">
                                            <span data-key="t-profile">Guru</span>
                                        </a>
                                        <a href="?page=siswa">
                                            <span data-key="t-profile">Siswa</span>
                                        </a>
                                    <?php } ?>
                                </li>

                            </ul>
                        </li>
                    <?php }
                    if ($_SESSION['level'] == "Bendahara") {
                        ?>
                        <li class="menu-title mt-2" data-key="t-components">Transaksi</li>

                        <li>
                            <a href="?page=pemasukan">
                                <i data-feather="layout"></i>
                                <span data-key="t-horizontal">Transaksi Pemasukan</span>
                            </a>
                        </li>
                        <li>
                            <a href="?page=pembayaran">
                                <i data-feather="layout"></i>
                                <span data-key="t-horizontal">Transaksi Pembayaran</span>
                            </a>
                        </li>
                        <li>
                            <a href="?page=pengeluaran">
                                <i data-feather="layout"></i>
                                <span data-key="t-horizontal">Transaksi Pengeluaran</span>
                            </a>
                        </li>

                        <?php
                    }
                    if ($_SESSION['level'] == "Kepala Sekolah" || $_SESSION['level'] == "Bendahara" || $_SESSION['level'] == "Sekretaris") { ?>
                        <li>
                            <a href="javascript: void(0);" class="has-arrow">
                                <i data-feather="file-text"></i>
                                <span data-key="t-pages">Laporan</span>
                            </a>
                            <ul class="sub-menu" aria-expanded="false">
                                <li><a href="?page=laporan-pendapatan" data-key="t-starter-page">Laporan Pendapatan</a></li>
                                <li><a href="?page=laporan-pengeluaran" data-key="t-maintenance">Laporan Pengeluaran</a></li>
                                <li><a href="?page=arus-kas" data-key="t-coming-soon">Arus Kas</a></li>
                                <li><a href="?page=laporan-pembayaran" data-key="t-coming-soon">Laporan Pembayaran</a></li>

                            </ul>
                        </li>
                    <?php }
                }
                ?>


            </ul>


        </div>
        <!-- Sidebar -->
    </div>
</div>
<!-- Left Sidebar End -->