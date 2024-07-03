class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "826c45ff9ffa13dee5afbd9a421288537ba3c37da0e5bc5e7e9646dba3b558df" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "77e7100669e25293044c07f7b311b3c9814de90767cd5cb56509fc69ab86889d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "e62179d9cded0171725f60487a07e0981e72bdad64937ed604a9b06d0fe75afb" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.142+1905137d0.tar.xz"
  version "0.14.0-dev.142+1905137d0"
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
