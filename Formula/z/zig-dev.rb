class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260926-123703"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "1cb0a229605314ff78ec58f5c64b7c7e32ee8a9a50037454ea7a28a32eda602c"
    sha256 cellar: :any_skip_relocation, sequoia:      "52636b9a0700a58d23cc92237d29a22311e9bae33c898bd82570dea6410c74fe"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4daf4065513802c01690443ecf95f821f7c164fc9270fc6ecd6d7249d697af8d"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "4cbf1a9e7d1c5d21f519e49ea4da833b5a0368c9edd98e3351732d9ed7c56597" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "9e2abc63ea4db5df046aa3088e1b660faca39c83da3bda544c734c65af5365c9" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "0ea7a4b858eb11cb738add922803eb228a915cdb2f8992e78787e564d54761bd" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.2313+5b9147ed5.tar.xz"
  version "0.17.0-dev.2313+5b9147ed5"
  license "MIT"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on macos: :big_sur # https://github.com/ziglang/zig/issues/13313
  depends_on "z3"
  depends_on "zstd"

  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install "lib" => "zig"
  end
end
