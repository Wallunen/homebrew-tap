class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "bee69d95ff81ac4f1e078bca70cecbb0233e64a404e85eb1e025ac629aa83dcc" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "1db7c1d7a9f1fe80d1fc2b0077f3d11784eaaded150e0b35c03575cc0ccc21d9" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "430c8509d46e7495965e84a5801239934c7bf8a4d16796ba3ee2a95e86527d21" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.11.0-dev.1898+36d47dd19.tar.xz"
  version "0.11.0-dev.1898+36d47dd19"
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
